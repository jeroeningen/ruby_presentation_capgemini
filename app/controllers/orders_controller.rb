class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    5.times { @order.orderlines.build }
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

  def show
    @order = Order.find params[:id]
  end

  def edit
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]
    if @order.update_attributes order_params
      flash[:notice] = t("order_updated")
      redirect_to order_path(@order)
    else
      render "edit"
    end
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    flash[:notice] = t("order_deleted")
    redirect_to orders_path
  end

  protected

  def order_params
    params.require(:order).permit(:name, orderlines_attributes: [:id, :product_name, :price, :quantity])
  end
end
