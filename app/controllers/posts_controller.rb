require 'httparty'
class PostsController < ApplicationController
  def index
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    posts_data = JSON.parse(response.body)

    posts_data.each do |post_data|
      Post.create(body: post_data["body"], title: post_data["title"])
    end
    @posts = Post.all
    #@posts = Post.all.page(params[:page])
  end



  def show

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
    params.require(:post).pernit(:title, :content)
  end
end
