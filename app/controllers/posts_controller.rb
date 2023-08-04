require 'httparty'
class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_User.id)
    @new_comment=Comment.new
    @posts = Post.all.page(params[:page])


    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    puts @q.inspect
  end


  def show
  @post=Post.find(params[:id])
  end


  def  new
    @post=Post.new()
  end


  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  def update

  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
