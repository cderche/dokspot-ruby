class ApplicationController < ActionController::Base
  include Pundit  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  #after_action :verify_authorized
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
  def after_sign_in_path_for(resource)
    if current_user.admin?
      puts "User exists: #{@user.nil?}"
      companies_path
    else
      resource.company
    end
  end
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    # Only add some parameters
    #devise_parameter_sanitizer.for(:new_user_invitation).concat :company
    # Override accepted parameters
    devise_parameter_sanitizer.for(:invite) do |u|
      u.permit(:email, :company_id)
    end
  end

end
