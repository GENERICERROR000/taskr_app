class UsersController < ApplicationController
  before_action :signed_in, except: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "you done created it~"
      redirect_to user_path(@user)
    else
      flash[:error] = "nerp!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "you done did it~"
      redirect_to user_path(@user)
    else
      flash[:error] = "no no no..."
      render :update
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:success] = "gewd jerb!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :manager, :password, :password_confirmation, :email, :phone)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
