class CommentsController < ApplicationController
  before_action :authenticate_User!

  def create
    @post=Post.find(params[:post_id])
    @comment= @post.comments.build(comment_params)
    @comment.user=current_User
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created'
    else
      render @post, alert: 'Failed to create comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
