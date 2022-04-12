class Public::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Genre[100227].ranking
    # @foods = RakutenWebService::Ichiba::Genre[100316].search(keyword:  'Ruby')
    # binding.irb
  end

  def show
    # @foods = RakutenWebService::Ichiba::Item.search({itemCode: params[:id]})
    @food_detail = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    # @comment = Comment.new
    # @food = Food.new
    @comment = Comment.new
    # @food_exist = Food.find_by(item_code: params[:id]) # Food ga create saretereba sono record wo syutoku !

    # unless @food_exist.nil?
    #   @comments = Comment.where(food_id: @food_exist.id)
    # end

    # @food = Food.find(id: )
    # binding.irb
  end

  # def create
  #   food = Food.new(food_params)
  #   food.item_code = params[:item_code]
  #   food.genre_id = 1 # FIX ME
  #   food.save
  #   redirect_to food_path(params[:item_code])
  # end

  # private
  # def food_params
  #     params.require(:food).permit(:name, :introduction)
  # end

end
