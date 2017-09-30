class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.first_name}"
      log_in(user)
      redirect_to user
    else
      flash[:error] = "Failed to login. Try again."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def safe_params
    params.require(:session).permit(:email, :password)
  end
end
