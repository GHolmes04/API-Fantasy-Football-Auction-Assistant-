class FranchisesController < ApplicationController

  def index
    render json: Franchise.where(league_id: 2)
    # GET /franchises
    # Franchise.all

    # GET /franchises/?league=2
    # Franchise.where(league: 2)
    # render json: Franchise.all

    # render json: Franchise.find(:all, :conditions => { :league => league_id})
  end


  def show
    render json: Franchise.find(params[:id])
  end

  def create
    franchise = Franchise.create(franchise_params)
    if franchise.save
      render json: franchise, status: :created
    else
      render json: franchise.errors, status: :unprocessable_entity
    end
  end

  def update
    franchise = Franchise.find(params[:id])
    if franchise.update(franchise_params)
      franchise.save
      render json: franchise
    else
      render json: franchise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    franchise = Franchise.find(params[:id])
    franchise.destroy
    head :ok
  end

  private
  def franchise_params
    params.require(:franchise).permit(:name, :user_id, :league_id)

  end
end
