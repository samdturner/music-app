class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      flash[:success] = "Welcome to the music-app!"
      redirect_to user_url(@user)
    else
      flash.now[:error] = "Invalid username/password"
      render :new
    end
  end

  private
    def user_params
      params.require(:users).permit(:email, :password)
    end
end
