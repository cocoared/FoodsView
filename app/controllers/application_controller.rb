class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    flash[:notice] = '新規登録が完了しました。'
    foods_path
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = 'ログインしました。'
    foods_path
  end
  # def after_sign_in_path_for(resource_or_scope)
  #   stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  # end


  def after_sign_out_path_for(resource)
    flash[:notice] = 'ログアウトしました。'
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image]) #sign_up時にnameとプロフィール画像のデータ操作を許可している。
  end

end
