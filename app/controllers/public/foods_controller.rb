class Public::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Genre[100227].ranking
    # @foods = RakutenWebService::Ichiba::Genre[100316].search(keyword:  'Ruby')
  end

  def show
    @foods = RakutenWebService::Ichiba::Item.search({itemCode:  params[:id]})
  end

  private
  def food_params
      params.require(:food).permit(:item_code)
  end

end
