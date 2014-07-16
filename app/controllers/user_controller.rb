class UserController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)

    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:user_name)
    end
end
