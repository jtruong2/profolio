class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.first_name}"
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "Failed to login. Try again."
      redirect_to root_path
    end
  end

  private

  def safe_params
    params.require(:session).permit(:email, :password)
  end
end
