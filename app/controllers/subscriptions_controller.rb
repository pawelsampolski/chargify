class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]

  # GET /subscriptions
  def index
    @subscriptions = Subscription.all
    json_response(@subscriptions)
  end


end
