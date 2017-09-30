class DisplayController < ApplicationController
  def show
    user = User.find_by(token: params[:token])
    render 'public/404.html' unless @user
  end

  private

  def safe_token
    params.permit(:token)
  end
end
