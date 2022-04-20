class Admin::FoodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @foods = RakutenWebService::Ichiba::Item.search(:genreId => '100227')
    @arr = @foods.map {|food| food} #配列の形成

    if params[:search].present?
      # foods = food.items_serach(params[:search])

    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      # foods = @tag.foods.order(created_at: :desc)
      item_codes = Food.joins(:tags).where(tags: {id: params[:tag_id]}).pluck(:item_code)
      @arr = []
      item_codes.each do |item_code|
        @foods = RakutenWebService::Ichiba::Item.search(:itemCode => item_code)
        @foods.map{|food| food}.each do |f|
          @arr.append(f)
        end
      end

    elsif params[:keyword].present?
      @foods = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
      @arr = @foods.map {|food| food} #配列の形成
    end

    @tag_lists = Tag.all
    @food_tags= params[:tag_id].present? ? Tag.find(params[:tag_id]).foods : Food.all
    @foods_page = Kaminari.paginate_array(@arr).page(params[:page]).per(10)

  end

  def show

    @food_detail = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    @food = Food.new
    @comment = Comment.new
    @food_exist = Food.find_by(item_code: params[:id]) # Food ga create saretereba sono record wo syutoku !

    unless @food_exist.nil?
      @comments = Comment.where(food_id: @food_exist.id)
    end


  end

  def create
    @food = Food.new(food_params)
    @food.item_code = params[:item_code]
    @food.save
    redirect_to admin_food_path(params[:item_code])
  end

  private
  def food_params
      params.require(:food).permit(:name, :item_code, tag_ids: [])
  end

end