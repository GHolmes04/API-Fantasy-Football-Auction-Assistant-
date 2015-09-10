class PlayersController < ApplicationController

  def index
    render json: Player.all
  end

  def show
    render json: Player.find(params[:id])
  end


  private
  def player_params
    params.require(:player).permit(:id, :name, :team, :position)
  end
end
