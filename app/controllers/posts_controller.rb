require 'httparty'
class PostsController < ApplicationController
  def index
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    posts_data = JSON.parse(response.body)

    posts_data.each do |post_data|
      current_User.posts.find_or_create_by(body: post_data["body"], title: post_data["title"])
    end
    @posts = Post.all
    @new_comment=Comment.new
    #@posts = Post.all.page(params[:page])


    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
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
