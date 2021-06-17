class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /questions or /questions.json
  def index
    @questions = Question.all
    puts cookies[:storage]
    cookies[:storage] = "HOPEFULLY THIS CHANGES"
    puts cookies[:storage]
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answerArray = @question.answers.collect(&:text)
    @correctArray = @question.answers.collect(&:correct)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def answer
    answer = params
    if params[:result] == "false"
      cookies[:completed] = cookies[:completed] + 1
    elsif 
      cookies[:correct] = cookies[:correct] + 1
      cookies[:completed] = cookies[:completed] + 1 
    end
    
    @cookieArray = cookies[:list] ? cookies[:list].split(",") : []
    number = @cookieArray.pop()
    cookies[:list] = (@cookieArray.class == Array) ? @cookieArray.join(',') : ''
    redirect_to questions_path + "/" + number
    
  end 

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:text, :description, :explaination, :category, :difficulty)
    end
end
