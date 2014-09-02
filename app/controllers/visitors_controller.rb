class VisitorsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def search
    puts "PARAMS: #{params}"
    @product = Product.find(params[:search][:query])
    if @product
      redirect_to @product
    else
      redirect_to root_path, alert: "No product was found for the code #{params[:query]}"
    end
  end
end
