class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = 1 # FIX ME
    @comment.food_id = params[:food_id]
    @comment.save
    redirect_back(fallback_location: root_path) #直前のページへリダイレクト
    # binding.irb
  end

  private
  def comment_params
      params.require(:comment).permit(:impression)
  end

end