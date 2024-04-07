class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_breadcrumbs

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :address, :city, :province_id, :postal_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone, :address, :city, :province_id, :postal_code])
  end

  def set_breadcrumbs
    @breadcrumbs = [
      { title: 'Home', url: root_path }
    ]
  end

end
