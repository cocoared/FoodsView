class HomesController < ApplicationController
  before_action :check
  def top
  end

  def check
    if user_signed_in?
      redirect_to foods_path
      flash[:notice] = "トップページに戻る場合は、ログアウトしてください。"
    end
  end
end
