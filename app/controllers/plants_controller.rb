class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    render json: find_plant
  end

  def update
    plant = find_plant
    plant.update(plant_params)
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def destroy
    plant = find_plant
    plant.destroy
    head :no_content
  end

  private

  def find_plant
    Plant.find(params[:id])
  end

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

end
