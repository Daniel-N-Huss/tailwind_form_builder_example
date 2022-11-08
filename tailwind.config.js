module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/lib/form_builders/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    minWidth: {
      '0': '0',
      '1/3': '33%',
      '2/3': '66%',
      '1/2': '50%'
    }
  }
}
