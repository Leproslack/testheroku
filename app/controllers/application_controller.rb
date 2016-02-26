class ApplicationController < ActionController::Base
  protect_from_forgery 

  def check_privileges!
    unless current_user.admin?
      flash[:alert] = 'You dont have enough permissions to be here'
      redirect_to @pin
    end
  end
  
  # def after_sign_in_path_for(resource)
  #   current_user_path
  # end

  def after_sign_out_path_for(resource_or_scope)
  request.referrer
  end

end
