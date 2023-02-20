class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    @machines = @snack.machines
  end
end
