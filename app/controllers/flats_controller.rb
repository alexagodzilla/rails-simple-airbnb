class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    @flats= Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new # Needed to instantiate the form_with
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    # No need for app/views/restaurants/create.html.erb
    # It takes the id from the just created flat
    redirect_to flats_path
  end


  def edit
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    # @restaurant.update(params[:restaurant]) # Will raise ActiveModel::ForbiddenAttributesError
    @flat.update(flat_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to flat_path(@flat)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @flat.destroy
    # No need for app/views/flats/destroy.html.erb
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :pic)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

end
