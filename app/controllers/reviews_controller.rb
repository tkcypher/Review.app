class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def create
  	@lesson = Lesson.find(params[:lesson_id])
  	@review = current_user.reviews.build(body: params[:review][:body], lesson_id: @lesson.id)
  	if @review.save
  	  redirect_to lesson_url(@lesson), notice: "レビューを投稿しました"
  	else
  	  redirect_to lesson_url(@lesson), alert: "レビューを投稿できませんでした"
  	end
  end

  def destroy
  	review = Review.find_by!(lesson_id: params[:lesson_id], user_id: current_user.id)
  	review.destroy
  	redirect_to lesson_url(params[:lesson_id]), notice: "レビューを削除しました"
  end
end
