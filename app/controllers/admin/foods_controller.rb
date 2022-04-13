class Admin::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Item.search(:genreId => '100227')
  end

  def show
    @food_detail = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    @comments = @food_detail.comments
  end


end
