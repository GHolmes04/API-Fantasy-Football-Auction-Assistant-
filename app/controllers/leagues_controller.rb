class LeaguesController < ApplicationController

  def index
    render json: League.all
  end

  def show
    render json: League.find(params[:id])
  end

  def create
    league = League.create(league_params)
    if league.save
      render json: league, status: :created
    else
      render json: league.errors, status: :unprocessable_entity
    end
  end

  def update
    league = League.find(params[:id])
    if league.update(league_params)
      league.save
      render json: league
    else
      render json: league.errors, status: :unprocessable_entity
    end
  end

  def destroy
    league = League.find(params[:id])
    league.destroy
    head :ok
  end

  private
  def league_params
    params.require(:league).permit(:name, :user_id, :mfl_id, :salary_cap, :roster_spots)
  end
end
