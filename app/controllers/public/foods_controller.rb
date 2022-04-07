class Public::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Genre[100316].ranking
    # @foods = RakutenWebService::Ichiba::Genre[100316].search(keyword:  'Ruby')
  end

  def show
    @foods = RakutenWebService::Ichiba::Item.search({itemCode:  params[:id]})
  end
end
