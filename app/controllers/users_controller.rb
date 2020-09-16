class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, ]
  before_action :login_check, only: [:show, :edit, :update, ]
  before_action :after_login, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user == @user
      if @user.update(user_params)
        redirect_to user_path(current_user.id), notice: "編集完了！"
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :introduce)
  end

  def set_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end

  def login_check
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def after_login
    if logged_in?
      redirect_to user_path(current_user.id)
    end
  end
  
end