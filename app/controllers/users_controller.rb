class UsersController < ApplicationController
  before_action :set_user, only: [:profile]

  def index
    @users = User.all
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: "您已经成功注册!"
    else
      flash[:notice] = "您的信息填写有误，请重新填写！"
      render 'new'
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @profile = @user.profile
  end

  private
    def set_member
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
