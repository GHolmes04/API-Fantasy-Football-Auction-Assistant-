class RostersController < ApplicationController

  def index
    render json: Roster.all
  end

  def show
    render json: Roster.find(params[:id])
  end

  def create
    roster = Roster.create(roster_params)
    if roster.save
      render json: roster, status: :created
    else
      render json: roster.errors, status: :unprocessable_entity
    end
  end

  def update
    roster = Roster.find(params[:id])
    if roster.update(roster_params)
      roster.save
      render json: roster
    else
      render json: roster.errors, status: :unprocessable_entity
    end
  end

  def destroy
    roster = Roster.find(params[:id])
    roster.destroy
    head :ok
  end

  private
  def roster_params
    params.require(:roster).permit(:name, :grade_level)
  end
end
