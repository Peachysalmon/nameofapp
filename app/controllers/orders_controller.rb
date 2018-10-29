class OrdersController < ApplicationController
before_action :authenticate_user!
  def index
    @orders = Order.includes(:product, :user).all
    @orders.user = current_user.includes(:product, :user).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
