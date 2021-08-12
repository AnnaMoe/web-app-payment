class OrdersController < ApplicationController

  def new
    @subscription = params[:subscription]
    @order = Order.new(
      subscription: Subscription.find(params[:subscription]),
      invoice_address: InvoiceAddress.new,
      payment_type: PaymentType.new
    )
  end

  def create
    @subscription = order_params[:subscription]
    @order = Order.new(
      subscription: Subscription.find(order_params[:subscription]),
    )

    @order.build_invoice_address(address_params)
    @order.build_payment_type(payment_params)

    if @order.save!
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def address_params
    params.require(:order).require(:invoice_address_attributes).permit(:first_name, :last_name, :street, :zip_code, :city, :country, :email)
  end
  
  def payment_params
    params.require(:order).require(:payment_type_attributes).permit(:lastschrift, :amazon_pay, :paypal, :name, :city, :card_number, :cvc, :expiry_date, :IBAN, :BIC, :credit_card)
  end
  

  def order_params
    params.require(:order).permit(:payment_type, :subscription, :invoice_address )
  end

end
