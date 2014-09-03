class VisitorsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  around_filter :catch_not_found
  
  def search
    query = params[:search][:query]
    @product = Product.friendly.find(query.upcase)
    authorize @product
    redirect_to @product
  end
  
  private
  
  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "No product was found for that code"
    redirect_to root_path
  end
end
