module ApplicationHelper


  def authenticate_admin_user!
    unless current_admin_user
      flash[:alert] = "You must be logged in as an admin to access this page."
      redirect_to admin_login_path
    end
  end
end
