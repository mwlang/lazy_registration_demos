# http://stackoverflow.com/questions/16471498/adding-extra-registration-fields-with-devise
# http://blog.plataformatec.com.br/2013/08/devise-3-1-now-with-more-secure-defaults/
# http://blog.12spokes.com/web-design-development/adding-custom-fields-to-your-devise-user-model-in-rails-4/
class RegistrationsController < Devise::RegistrationsController
  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
  
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up).merge(user_params)
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update).merge(user_params)
  end
end