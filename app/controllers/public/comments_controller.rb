class Public::CommentsController < ApplicationController

  def create
    food = Food.find(params[:food_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.food_id = params[:food_id]
    if comment.save
      redirect_to food_path(food.item_code)
    else flash[:notice] = '空欄では投稿できません'
      redirect_to request.referer
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:impression, :rate)
  end

end
