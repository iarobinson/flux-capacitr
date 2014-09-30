class UsersController < ApplicationController
  before_action :ensure_logged_out, only: [:create, :new]
  
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to :root
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :root
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
end