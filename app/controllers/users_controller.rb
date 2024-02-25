class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し,
    # @post_imagesに渡す という処理を行うことで、個人の投稿したものをすべて表示させる
  end

  def index
    @users = User.all #インスタンス変数
    @user = current_user
  end


  def edit
  @user = User.find(params[:id])
  end


  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id #現在ログインしている人の情報
      redirect_to user_path(current_user)
    end
  end

end