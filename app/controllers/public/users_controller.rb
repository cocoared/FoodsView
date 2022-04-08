class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_my_page_path(@user)
    else
      flash.now[:alert] = "ユーザー情報を入力してください。"
      render :edit
    end
  end

  def unsubscribe #退会確認画面の表示
  end

  def withdraw #退会フラグを切り替える
    @user = current_user
    @user.update(is_deletd: true) #is_deletedカラムの退会フラグを退会（true）に更新する
    reset_session #ログアウトさせる
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
