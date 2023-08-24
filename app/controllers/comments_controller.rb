class CommentsController < ApplicationController
  before_action :authenticate_User!

  def create
    @post=Post.find(params[:post_id])
    @comment= @post.comments.build(comment_params)

    @comment.user=current_User

    if @comment.save
      respond_to do |format|

        format.html{redirect_to posts_path, notice: 'Comment was successfully created'}
        format.js
      end

    else
      render posts_path, alert: 'Failed to create comment'
    end
  end



  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html{   redirect_to root_path, notice: 'Comment was Successfully Deleted'}
      format.js
    end
    # redirect_to root_path, notice: 'Comment was Successfully Deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
