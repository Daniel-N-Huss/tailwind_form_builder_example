class AdventurersController < ApplicationController
  def index
    @adventurers = Adventurer.all
  end

  def show
  end

  def update
  end
end
