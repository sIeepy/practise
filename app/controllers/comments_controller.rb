class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to movie_path(params[:movie_id]), notice: 'Comment was succesfully created'
    else
      redirect_to movie_path(params[:movie_id]), alert: 'Comment was not created'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_user.id == comment.user_id
      comment.destroy
      redirect_to movie_path(params[:movie_id]), notice: 'Comment was destroy'
    else
      redirect_to movie_path(params[:movie_id]), alert: 'Comment was not destroy'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :movie_id)
  end
end
