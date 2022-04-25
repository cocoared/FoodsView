class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
     redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to users_my_page_path(@user)
    else
      flash.now[:alert] = "ユーザー情報を入力してください。"
      render :edit
    end
  end

  def unsubscribe #退会確認画面の表示
  end

  def withdraw #退会フラグを切り替える
    @user = current_user
    @user.update(is_deleted: true) #is_deletedカラムの退会フラグを退会（true）に更新する
    reset_session #ログアウトさせる
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to user_path(current_user)
    end
  end

end
