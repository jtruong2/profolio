class ProfileController < ApplicationController
  def new
    @user = User.find(safe_params[:user_id])
    @profile = Profile.new(user_id: @user.id)
  end

  def create
    user = User.find(safe_params[:user_id])
    profile = user.profiles.create(safe_params[:profile])
    if profile.save
      flash[:success] = "Profile Added."
      redirect_to user_profile_new_path(user)
    else
      flash[:error] = "Profile couldn't be added, Try again."
      redirect_to user_profile_new_path(user)
    end
  end


  private

  def safe_params
    params.permit({:profile => [:link, :provider]}, :user_id)
  end
end
