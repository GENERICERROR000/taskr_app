class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in, :admin

  def home
    @tasks = Task.order("updated_at DESC").first(8)
  end

  def about
  end

  private

  def admin
    if current_user.manager
      true
    else
      flash[:error] = "YOU IS NO MANAGER - CAN'T DO DAT!!"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in
    if !!current_user
      return true
    else
      redirect_to root_path
    end
  end

  def already_signed_in
    if session[:user_id]
      redirect_to root_path
    end
  end

end
