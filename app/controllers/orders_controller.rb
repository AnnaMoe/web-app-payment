class OrdersController < ApplicationController

  def new
    @order = Order.new(
      subscription: Subscription.find(params[:subscription]),
      invoice_address: InvoiceAddress.new
    )
  end

  def create

  end

  def show
    @order = Order.find(params[:id])
  end
end
