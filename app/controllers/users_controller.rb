class UsersController < ApplicationController
  before_action :load_menu

  def new
    @user = User.new
  end

  def create
    @user = User.new params_user
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit :email, :name, :password, :password_confirmation
  end
end
