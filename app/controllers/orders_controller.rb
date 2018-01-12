class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    if @order.save
      flash[:notice] = t("order_created")
      redirect_to orders_path
    else
      render "new"
    end
  end

  protected

  def order_params
    params.require(:order).permit(:name)
  end
end
