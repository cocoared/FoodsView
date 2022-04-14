class Admin::FoodsController < ApplicationController

  def index
    @foods = RakutenWebService::Ichiba::Item.search(:genreId => '100227')

    arr = @foods.map {|food| food} #配列の形成

    if params[:search].present?
      foods = food.items_serach(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      foods = @tag.foods.order(created_at: :desc)
    else
      items = Food.all.order(created_at: :desc)
    end

    @tag_lists = Tag.all

    @food_tags= params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Food.all

    @foods_page = Kaminari.paginate_array(arr).page(params[:page]).per(10)

  end
    # @foods = RakutenWebService::Ichiba::Genre[100316].search(keyword:  'Ruby')
    # binding.irb

  def show
    # @foods = RakutenWebService::Ichiba::Item.search({itemCode: params[:id]})
    @food_detail = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    # @comment = Comment.new
    @food = Food.new
    @comment = Comment.new
    @food_exist = Food.find_by(item_code: params[:id]) # Food ga create saretereba sono record wo syutoku !

    unless @food_exist.nil?
      @comments = Comment.where(food_id: @food_exist.id)
    end

    # @food = Food.find(id: )
    # binding.irb
  end

  def create
    @food = Food.new(food_params)
    @food.item_code = params[:item_code]
    # @food.genre_id = 1 # FIX ME
    @food.save
    # binding.irb
    redirect_to admin_food_path(params[:item_code])
  end

  private
  def food_params
      params.require(:food).permit(:name, :item_code, tag_ids: [])
  end

end