class HomesController < ApplicationController
  before_action :check
  def top

  end
  def check
    redirect_to foods_path if user_signed_in?
  end
end
