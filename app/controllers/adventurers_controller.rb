class AdventurersController < ApplicationController
  def index
    @adventurers = Adventurer.all
  end

  def show
    @adventurer = Adventurer.find(params[:id])
  end

  def update
    @adventurer = Adventurer.find(params[:id])

    if @adventurer.update(adventurer_params)
      flash[:notice] = "#{@adventurer.name} was updated successfully!"
      redirect_to adventurer_path(@adventurer)
    else
      flash[:alert] = @adventurer.errors.full_messages.join(", ")
      redirect_to adventurer_path(@adventurer)
    end


  end

  def adventurer_params
    params.require(:adventurer).permit(:name, :city, :klass, :alignment, :primary_weapon, :secondary_weapon)
  end
end
