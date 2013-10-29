class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def confirm_user!
    unless current_user.confirmed?
      redirect_to unconfirmed_path
    end
  end
end
