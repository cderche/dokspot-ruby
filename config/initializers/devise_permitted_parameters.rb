module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
    
    devise_parameter_sanitizer.for(:sign_in) do |u| 
      u.permit(:email, :password, :remember_me)
    end
    
    devise_parameter_sanitizer.for(:invite) do |u|
      u.permit(:email, :company_id)
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
