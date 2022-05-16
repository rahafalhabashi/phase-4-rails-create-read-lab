class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def show
    plants = Plant.find_by(id: params[:id])
    if plants
      render json: plants
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
