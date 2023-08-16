class RatingsController<ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @rating = current_User.ratings.build(post: @post)
  end

  def create
    @post=Post.find(params[:rating][:post_id])
    @rating= current_User.ratings.build(rating_params)
    @rating.post=@post

    if @rating.save
      redirect_to posts_path, notice: "Rating submitted successfully"
    else
      # render :new
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:rating)
  end
end