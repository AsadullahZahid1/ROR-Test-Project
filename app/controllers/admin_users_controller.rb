class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!
   def create
    @admin_user = AdminUser.new(admin_user_params)
    # Your create logic here
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_user_params)
      redirect_to admin_user_path(@user)
    end
    # Your update logic here
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:email, :password)
  end
end




