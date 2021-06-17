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
  
  def completed
     @h1 = Attempt.all.where(history_id: cookies[:userId].to_i)
     Attempt.create(history_id: cookies[:userId].to_i, time: Time.now, correct: cookies[:correct].to_i, questions: cookies[:max], difficulty: "All", category: "All")
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
      #puts cookies[:completed]
      #puts cookies[:completed].to_i
      #puts cookies[:completed].to_i+1
      temp = cookies[:completed].to_i + 1
      cookies[:completed] = temp
    elsif
      temp = cookies[:correct].to_i + 1
      cookies[:correct] = temp
      temp = cookies[:completed].to_i + 1
      cookies[:completed] = temp
    end
    
    @cookieArray = cookies[:list] ? cookies[:list].split(",") : []
    number = @cookieArray.pop()
    cookies[:list] = (@cookieArray.class == Array) ? @cookieArray.join(',') : ''
    if cookies[:completed].to_i < cookies[:max].to_i
      redirect_to questions_path + "/" + number
    else
      list = Array.new(60) { |i| 1 * i + 1}
      list = list.shuffle()
      cookies[:list] = (list.class == Array) ? list.join(',') : ''
      redirect_to "/results/completed"
    end
    
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
