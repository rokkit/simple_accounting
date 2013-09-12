class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :record_query

  def record_query
    HttpRequest.create! parameters: params.inspect.to_s, ip_address: request.ip, method: request.method
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  include PublicActivity::StoreController

end
