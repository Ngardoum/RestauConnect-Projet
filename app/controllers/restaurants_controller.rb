class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :dashboard]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @menus = @restaurant.menus
  end

  def dashboard
    @menus = @restaurant.menus
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
