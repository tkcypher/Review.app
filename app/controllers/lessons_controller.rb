class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy, :takers]
  before_action :authenticate_user!
  # before_action :correct_user, only: [:edit, :update]
  before_action :correct_user, only: [:destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @reviews = @lesson.reviews.order(created_at: :desc)
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: '授業を追加しました' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: '授業を編集しました' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: '授業を削除しました' }
      format.json { head :no_content }
    end
  end

  def takers
    @lesson = Lesson.find(params[:id])
    @takers = @lesson.takes.order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :teacher, :user_id)
    end
    def correct_user
      lesson = Lesson.find(params[:id])
      if current_user.id != lesson.user.id
        redirect_to root_path
      end
    end
end
