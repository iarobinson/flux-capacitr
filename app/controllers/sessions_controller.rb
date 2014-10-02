class SessionsController < ApplicationController
  before_action :ensure_logged_out, except: [:destroy]
  
  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login_user!(@user)
      redirect_to :root
    else
      flash.now[:errors] = ["Invalid login credentials."]
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to :root
  end

  def guest_login
    login_user!(User.find_by_email('guest@flux-capacitr.com'))
    redirect_to :root
  end

  def new
    @user = User.new
    render :new
  end
end
