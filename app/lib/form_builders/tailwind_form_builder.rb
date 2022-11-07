module FormBuilders
  class TailwindFormBuilder < ActionView::Helpers::FormBuilder

    class_attribute :text_field_helpers, default: field_helpers - [:label, :check_box, :radio_button, :fields_for, :fields, :hidden_field, :file_field]
    #  leans on the FormBuilder class_attribute `field_helpers`
    #  you'll want to add a method for each of the specific helpers listed here if you want to style them


    text_field_helpers.each do |field_method|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
          def #{field_method}(method, options = {})
            if options.delete(:tailwindified)
              super
            else
              text_like_field(#{field_method.inspect}, method, options)
            end
          end
      RUBY_EVAL
    end

    def submit(value = nil, options = {})
      custom_opts, opts = partition_custom_opts(options)

      classes = <<~CLASSES.strip
        shadow bg-yellow-800 focus:shadow-outline focus:outline-none text-white font-bold 
        py-2 px-4 rounded hover:bg-yellow-700
      CLASSES

      classes += " #{custom_opts[:class]}"
      super(value, { class: classes }.merge(opts))
    end


    def tailwind_label(method, label_options, field_options)
      text, label_opts = if label_options.present?
        [label_options[:text], label_options.except(:text)]
      else
        [nil, {}]
      end

      label_classes = label_opts[:class] || "block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4"
      label_classes += " text-slate-600 dark:text-slate-400" if field_options[:disabled]
      label(method, text, {
        class: label_classes
      }.merge(label_opts.except(:class)))
    end


    private

    def text_like_field(field_method, object_method, options = {})
      custom_opts, opts = partition_custom_opts(options)

      label = tailwind_label(object_method, custom_opts[:label], options)

      error_label = if errors_for(object_method).present?
        tailwind_label(object_method, {text: "#{@object.errors[object_method].collect(&:titleize).join(", ")}", class: "font-bold text-red-500"}, options)
      end


      classes = <<~CLASSES.strip
        min-w-2/3 bg-gray-200 border-2 border-gray-200 rounded py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white
      CLASSES

      classes += border_color_classes(object_method)
      classes += " #{custom_opts[:class]}"

      field = send(field_method, object_method, {
        class: classes,
        title: errors_for(object_method)&.join(" ")
      }.compact.merge(opts).merge({tailwindified: true}))

      label + error_label + field
    end

    def border_color_classes(object_method)
      if errors_for(object_method).present?
        " border-2 border-red-400 focus:border-rose-200"
      else
        " border border-gray-300 focus:border-yellow-700"
      end
    end

    CUSTOM_OPTS = [:label, :class].freeze
    def partition_custom_opts(opts)
      opts.partition { |k, v| CUSTOM_OPTS.include?(k) }.map(&:to_h)
    end

    def errors_for(object_method)
      return unless @object.present?

      @object.errors[object_method]
    end
  end
end
