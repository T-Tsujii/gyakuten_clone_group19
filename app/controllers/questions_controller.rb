class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @solution = Solution.new
    @solutions = @question.solutions
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice]="登録に成功しました"
      redirect_to action: :index
    else
      flash[:alert]="質問を入力してください"
      @questions = Question.all
      render action: :index
    end
  end

  private
  def question_params
    params.permit(:title,:detail)
  end

end
