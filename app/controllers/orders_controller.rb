class OrdersController < ApplicationController
before_action :authenticate_user!
  def index
    if current_user.admin?
      @orders = Order.includes(:product, :user).all
    else
      @orders = Order.where(user_id: current_user.id)
    end
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
