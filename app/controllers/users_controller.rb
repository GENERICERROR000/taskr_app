class UsersController < ApplicationController
  before_action :signed_in, except: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :already_signed_in, only: :new

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
      flash[:success] = "You Now Exist In This World"
      redirect_to user_path(@user)
    else
      flash[:error] = "Something Went Wrong - Existing Is Hard"
      render :new
    end
  end

  def show
    @events = []
    @user.tasks.each do |task|
      if !@events.include?(task.event)
        @events << task.event
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You Changed Yourself"
      redirect_to user_path(@user)
    else
      flash[:error] = "You Did Not Successfully Change Yourself"
      render :update
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:success] = "You Destroyed Yourself - As Only You Can"
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
