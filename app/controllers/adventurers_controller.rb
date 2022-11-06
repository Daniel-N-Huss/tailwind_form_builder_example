class AdventurersController < ApplicationController
  def index
    @adventurers = Adventurer.all
  end

  def show
    @adventurer = Adventurer.find(params[:id])
  end

  def update
    @adventurer = Adventurer.find(params[:id])
    @adventurer.update(adventurer_params)
    redirect_to adventurer_path(@adventurer)
  end

  def adventurer_params
    params.require(:adventurer).permit(:name, :city, :klass, :alignment, :primary_weapon, :secondary_weapon)
  end
end
