class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
  	@lesson = Lesson.find(params[:lesson_id])
  	@review = Review.find(params[:review_id])
  	@favorite = current_user.favorites.build(review: @review)
  	if favorite.save
  	  redirect_to lesson_path(@lesson), notice: "いいねしました"
  	else
  	  redirect_to lesson_path(@lesson), alert: "いいねできませんでした"
  	end
  end

  def destroy
  	@lesson = Lesson.find(params[:lesson_id])
    @favorite = current_user.favorites.find_by!(review_id: params[:review_id])
    @favorite.destroy
    redirect_to lesson_path(@lesson), notice: "いいねを取り消しました"
  end
end
