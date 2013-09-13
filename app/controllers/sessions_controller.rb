class SessionsController < Devise::SessionsController
   def create
    if User.where(email: params[:user][:email]).first.try { |u| u.check_type_of_login(params[:user][:password]) }
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      redirect_to data_path
    end
   end
end
