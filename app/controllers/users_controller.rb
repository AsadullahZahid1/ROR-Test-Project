class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end



  def search
    @search_query=params[:search]
    @users=User.tagged_with(@search_query,on: :skills )
  end




  # def live_search
  #   @query=params[:search]
  #   @users = User.tagged_with(@query, on: :skills)
  #
  #
  # end
end