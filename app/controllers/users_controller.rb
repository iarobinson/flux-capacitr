class UsersController < ApplicationController
  before_action :ensure_logged_out, only: [:create, :new]
  before_action :ensure_can_edit, only: [:edit, :update]
  
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
  
  def edit
    @user = User.friendly.find(params[:id])
    render :edit
  end

  def new
    @user = User.new
    render :new
  end
  
  def show
    @user = User.includes(:blogs)
                .includes(:followed_blogs)
                .friendly.find(params[:id])
    render :show
  end
  
  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to :root
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  
  private
  def ensure_can_edit
    if User.friendly.find(params[:id]) != current_user
      flash[:errors] = "You are not authorized to perform that action."
      redirect_to :root
    end
  end
end