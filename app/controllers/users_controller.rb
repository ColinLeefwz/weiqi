class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "您已经成功注册！"
      flash[:color] = "valid"
      redirect_to @user
    else
      flash[:notice] = "注册失败！"
      flash[:color] = "invalid"
      render "new"
    end

  end

  def edit
  end

  def update
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :email, :salt)
    end
end
