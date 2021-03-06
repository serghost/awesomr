class SessionsController < ApplicationController

  def new
    @title = t("users.title.sign_in")
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = t("sessions.flash.create")
      @title = t("users.title.sign_in")
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
