class AdventurersController < ApplicationController
  def index
    @adventurers = Adventurer.all
  end

  def show
    @adventurer = Adventurer.find(params[:id])
  end

  def update
  end
end
