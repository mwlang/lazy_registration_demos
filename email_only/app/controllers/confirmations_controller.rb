class ConfirmationsController < Devise::ConfirmationsController
  # Remove the first skip_before_filter (:require_no_authentication) if you
  # don't want to enable logged users to access the confirmation page.
  skip_before_filter :require_no_authentication
  skip_before_filter :authenticate_user!, except: [:confirm_user]

  def update
    with_unconfirmed_confirmable do
      if confirmable_user.blank_password?
        confirmable_user.update_password(params[:user])
        if confirmable_user.valid?
          do_confirm
        else
          do_show
          confirmable_user.errors.clear # prevent rendering :new
        end
      else
        self.class.add_error_on(self, :email, :password_allready_set)
      end
    end

    render 'devise/confirmations/new' unless confirmable_user.errors.empty?
  end

  def confirm_user
    if confirmation_token && (@confirmable_user = User.find_by(:confirmation_token => confirmation_token))
      do_show
    else
      flash[:error] = "Invalid confirmation token"
      redirect_to :unconfirmed
    end
  end
  
  def show
    with_unconfirmed_confirmable do
      confirmable_user.blank_password? ? do_show : do_confirm
    end
    unless confirmable_user.errors.empty?
      self.resource = confirmable_user
      render 'devise/confirmations/new' 
    end
  end
  
  protected

  def confirmation_token
    @confirmation_token ||= params["user"] && params["user"]["confirmation_token"] || params["confirmation_token"]
  end
  
  def confirmable_user
    @confirmable_user ||= User.find_or_initialize_with_error_by(:confirmation_token, confirmation_token)
  end
    
  def with_unconfirmed_confirmable
    unless confirmable_user.new_record?
      confirmable_user.only_if_unconfirmed {yield}
    end
  end

  def do_show
    self.resource = confirmable_user
    render 'devise/confirmations/show'
  end

  def do_confirm
    confirmable_user.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, confirmable_user)
  end
end