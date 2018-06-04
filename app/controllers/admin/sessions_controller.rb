module Admin
  class SessionsController < BaseController
    layout "admin/layouts/application"
    def new
      return unless logged_in?
      flash[:info] = t "logged_in"
      redirect_to admin_root_url
    end

    def create
      user = User.find_by email: params[:session][:email].downcase
      if user && user.authenticate(params[:session][:password]) && user.role == Settings.setting_model.role_admin
        log_in user
        redirect_back_or admin_root_url
      else
        flash.now[:danger] = t "invalid"
        render :new
      end
    end

    def destroy
      log_out if logged_in?
      redirect_to admin_root_url
    end
  end
end
