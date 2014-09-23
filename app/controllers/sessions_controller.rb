class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[email], user_params[password])
    if @user
      login_user!(@user)
      redirect_to :root
    else
      flash.now[:errors] = ["Invalid login credentials."]
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to :root
  end

  def new
    @user = User.new
    render :new
  end
end
