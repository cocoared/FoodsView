class Admin::CommentsController < ApplicationController

  def create
    food = Food.find(params[:food_id])
    comment = Comment.new(comment_params)
    #comment.admin_id = current_admin.id
    comment.food_id = params[:food_id]
    comment.save
    redirect_to admin_food_path(food.item_code)
  end

  def destroy
    Comment.find_by(id: params[:id], food_id: params[:food_id]).destroy
    redirect_to admin_food_path(food.item_code)
  end

  private
  def comment_params
    params.require(:comment).permit(:impression, :rate)
  end

end
