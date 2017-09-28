class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(safe_params)
    if user.save
      flash[:success] = "Account successfully created."
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Registration failed. Please try again."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
