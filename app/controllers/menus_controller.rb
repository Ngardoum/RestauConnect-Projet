class MenusController < ApplicationController
  before_action :set_restaurant
  before_action :set_menu, only: [:edit, :update, :destroy]

  def index
    @menus = @restaurant.menus
  end

  def new
    @menu = @restaurant.menus.new
  end

  def create
    @menu = @restaurant.menus.new(menu_params)
    if @menu.save
      redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully deleted.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_menu
    @menu = @restaurant.menus.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price)
  end
end

