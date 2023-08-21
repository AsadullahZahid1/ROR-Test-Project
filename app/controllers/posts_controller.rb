
  class PostsController < ApplicationController
     before_action :authenticate_User!

    def index
      # byebug
      # if params[:search]
      #   @posts=current_User.posts.where("title LIKE ? OR body  LIKE ?", "%#{params[:search]}%","%#{params[:search]}%")
      #   @comments=current_User.comments.where("content LIKE ?","%#{params[:search]}%")
      #   render 'search_results'
      # else
      #     @posts = Post.where(user_id: current_User.id)
      # end

       @posts=Post.where(user_id: current_User.id)
       # @post=Post.new
       @comment=Comment.new
       @rating=Rating.new
    end

    def  new

    end


    def create

    end
    def show

    end
    def search
      # byebug
        @query = params[:search]
        @posts=Post.where("title LIKE ? OR body  LIKE  ?", "%#{@query}%","%#{@query}%")
        @comments=Comment.where("content LIKE ?","%#{@query}%")

      # respond_to do |format|
      #   format.html
      #   format.js
      # end
      render layout: false
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
  end
