class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome,:cidade_id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/403.html", alert: "Você não tem autorização para realizar essa ação!"
  end
end
