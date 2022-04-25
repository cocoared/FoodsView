# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]  
  #before_action :cehck_guest, only: [:new]



# GET /resource/sign_in   def new
#     binding.irb
#     super
#     sign_out
#   end

  # POST /resource/sign_in
  # def create
    # binding.irb
    # super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def guest_sign_in
    user = User.guest
    sign_in user #ゲストユーザーをログイン状態する。
    flash[:notice] = 'ゲストユーザーでログインしました。'
    redirect_to foods_path
  end

  protected

  # 退会しているかを判断するメソッド
  def user_state
    binding.irb

    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])

    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user

    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password])
      ## 【処理内容3】
      if @user.is_deleted == true
        flash[:alert] =  "退会済みのアカウントです。再度新規登録してください。"
        redirect_to new_user_registration_path
      else
        sign_in @user
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
