class TakesController < ApplicationController
  before_action :authenticate_user!
  def create
  	@lesson = Lesson.find(params[:lesson_id])
  	@take = current_user.takes.build(lesson: @lesson)
  	if @take.save
  	  redirect_to lessons_url, notice: "履修登録しました"
  	else
  	  redirect_to lessons_url, alert: "履修登録に失敗しました"
  	end
  end

  def destroy
  	@take = current_user.takes.find_by!(lesson_id: params[:lesson_id])
  	@take.destroy
  	redirect_to lessons_url, notice: "履修を取り消しました"
  end
end
