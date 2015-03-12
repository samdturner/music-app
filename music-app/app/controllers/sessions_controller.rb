class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:email],
                                     params[:password])
    if @user
      log_in_user!(@user)
      flash[:success] = "Welcome back to the music-app"
      redirect_to user_url(@user)
    else
      flash[:error] = "Invalid username/password"
      redirect_to new_session_url
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end
end
