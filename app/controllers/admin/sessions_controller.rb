class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    admin_log_out if admin_logged_in?
    redirect_to root_url
  end
end
