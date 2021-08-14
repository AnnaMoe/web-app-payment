class SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = Subscription.vorauszahlung.yearly
  end

end
