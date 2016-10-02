module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :name
    # devise_parameter_sanitizer.for(:account_update) << :name

    devise_parameter_sanitizer.permit(:sign_in) do |u|
      # u.permit(:email, :password, :remember_me)
      u.permit(:email, :password, :remember_me, :name)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      # u.permit(:email, :password, :remember_me)
      u.permit(:password, :password_confirmation, :current_password, :name)
    end

    devise_parameter_sanitizer.permit(:invite) do |u|
      u.permit(:email, :company_id)
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
