class VisitorsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  around_filter :catch_not_found

  
  
  def index
  end
  
  def search
    query = params[:search][:query]
    @product = Product.friendly.find(query.upcase)

    require 'mixpanel-ruby'
    tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
    if user_signed_in?
      tracker.track(current_user.id, 'Search', @product.attributes)
    else
      tracker.track(0, 'Search', @product.attributes)
    end

    authorize @product
    redirect_to @product
  end
  
  def service
  end
  
  def about
    @customer = Customer.new
  end

  def promise
  end

  def privacy
  end
  
  private
  
  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "No product was found for that code. Please ensure the code in the following format: ABC123"
    redirect_to root_path
  end
end
