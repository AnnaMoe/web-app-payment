class OrdersController < ApplicationController

  def new
    @subscription = Subscription.find(params[:subscription])
    @subscriptions = Subscription.where(plan_type: @subscription.plan_type).order(duration_in_months: :desc)
    #@vorauszahlung_options = [['12 Monate', '14'], ['6 monate', '1']]
    @vorauszahlung_options = @subscriptions.vorauszahlung
    @monatszahlung_options = @subscriptions.monatszahlung

    @order = Order.new(
      invoice_address: InvoiceAddress.new,
      payment_type: PaymentType.new
    )
  end

  def create
    # I want to create an Order object.
    # but, for creating an order, I need first to know which subscription it will be.
    # then, I use the hidden input subscription[choice_of_payment](which we created in the new.html.erb) to check if it is "vorauszahlung" or "monatszahlung"
    if params[:subscription][:choice_of_payment] == "vorauszahlung"
      # we give it the subscription_id
      subscription_id = params[:subscription][:vorauszahlung]
    else
      subscription_id = params[:subscription][:monatszahlung]
    end
    # find the subscription with this subscription_id in the database(getting all the attributes of it)
    @subscription = Subscription.find(subscription_id)

    @order = Order.new(
      # without simple form
      subscription: @subscription,
    )
    #methods of simple form (nested models)
    @order.build_invoice_address(address_params)
    @order.build_payment_type(payment_params)

    if @order.save
      redirect_to order_path(@order)
    else
      # need all the variables again, which are used to implement the 'new.html.erb
      @subscriptions = Subscription.where(plan_type: @subscription.plan_type).order(duration_in_months: :desc)
      @vorauszahlung_options = @subscriptions.vorauszahlung
      @monatszahlung_options = @subscriptions.monatszahlung
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
    params.require(:order).require(:payment_type_attributes).permit(:payment_type, :amazon_pay, :paypal, :name, :city, :card_number, :cvc, :expiry_date, :IBAN, :BIC)
  end
  

  def order_params
    params.require(:order).permit(:payment_type, :subscription, :invoice_address )
  end

end
