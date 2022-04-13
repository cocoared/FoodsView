class Public::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Item.search(:genreId => '100227')
    arr = @foods.map {|food| food} #配列の形成


    @foods_page = Kaminari.paginate_array(arr).page(params[:page]).per(10)

    # @foods = RakutenWebService::Ichiba::Genre[100316].search(keyword:  'Ruby')
    # binding.irb
    # @food_total = @foods['food_total'].to_f
    # @page = params['page'].to_i # 一覧ページはGETパラメーターとして受け取る
    # all_page = (@food_total / 30).ceil
    # @pages = [*1..all_page]
  end

  def show
    # @foods = RakutenWebService::Ichiba::Item.search({itemCode: params[:id]})
    @food_detail = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    food = Food.find_by(item_code: params[:id])

    if food.present?
       @comments = food.comments
    else
      @comments = []
    end


    @food = Food.new
    @comment = Comment.new
    # @food_exist = Food.find_by(item_code: params[:id]) # Food ga create saretereba sono record wo syutoku !

    # unless @food_exist.nil?
    #   @comments = Comment.where(food_id: @food_exist.id)
    # end

    # @food = Food.find(id: )
    # binding.irb
  end

   def create
    food = Food.new(food_params)
    food.item_code = params[:item_code]
    # food.genre_id = 1 # FIX ME
    food.save
    redirect_to food_path(params[:item_code])
   end

  private
  def food_params
      params.require(:food).permit(:name, :item_code)
  end

end
