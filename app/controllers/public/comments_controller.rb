class Public::CommentsController < ApplicationController
  def create
    food = Food.find(params[:food_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.food_id = params[:food_id]
    comment.save
    redirect_to food_path(food.item_code)
  end

  private
  def comment_params
      params.require(:comment).permit(:impression)
  end

end
