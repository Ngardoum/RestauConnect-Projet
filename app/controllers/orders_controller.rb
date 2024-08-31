class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = current_user.orders.find_or_create_by(restaurant: @restaurant, status: 'pending')
    @menu = @restaurant.menus.find(params[:menu_id])

    order_item = @order.order_items.find_or_initialize_by(menu: @menu)
    order_item.quantity += params[:quantity].to_i
    order_item.price = @menu.price
    order_item.save

    @order.total_price += @menu.price * params[:quantity].to_i
    if @order.save
      redirect_to restaurant_menus_path(@restaurant), notice: 'Item added to your order.'
    else
      redirect_to restaurant_menus_path(@restaurant), alert: 'Failed to add item to order.'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Order was successfully deleted.'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :total_price, :restaurant_id, order_items_attributes: [:id, :quantity, :price, :menu_id])
  end
end

