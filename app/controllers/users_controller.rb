class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
  	@user = User.find(params[:id])
    @user_reviews = @user.reviews.order(created_at: :desc)
    @takes = @user.takes.order(created_at: :desc)
  end

  def takes
  	@user = User.find(params[:id])
    @user_lessons = @user.lessons.order(created_at: :desc)
  end

  def follows
  	@user = User.find(params[:id])
  	@follows = @user.followings.page(params[:page]).per(20).order(created_at: :desc)
  end

  def followers
  	@user = User.find(params[:id])
  	@followers = @user.followers.page(params[:page]).per(20).order(created_at: :desc)
  end

end
