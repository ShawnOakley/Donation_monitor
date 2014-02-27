class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	# fail
  	params[:user] = resource.id
  	params[:donations] = User.find(resource.id).donations
  	user_path(params)
  end

end
