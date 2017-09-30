class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(safe_params)
    if user.save
      flash[:success] = "Account successfully created."
      log_in(user)
      redirect_to user_path(user)
    else
      flash[:error] = "Registration failed. Please try again."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(safe_params)
      flash[:success] = 'Updated profile.'
      redirect_to user_path(user)
    else
      flash[:error] = 'Could not update. Try again.'
      render 'edit'
    end
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end
end
