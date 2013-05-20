module ApplicationHelper
  
  def current_user_exists?
    begin
      !!current_user
    rescue
      false
    end
  end
end
