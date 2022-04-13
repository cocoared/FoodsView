class Admin::CommentsController < ApplicationController
  def create
    food = Food.find(params[:food_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.food_id = params[:food_id]
    comment.save
    redirect_back(fallback_location: root_path) #直前のページへリダイレクト
  end

  def destroy
    Comment.find_by(id: params[:id], book_id: params[:food_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:impression)
  end

end
