require 'json'

class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: %i[ show edit update destroy ]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = current_user.quizzes.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "hello-filename", template: "quizzes/print_pdf", formats: [:html]
      end
    end
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  # def edit
  # end

  # POST /quizzes or /quizzes.json
  def create
    client = OpenAI::Client.new
    prompt = "Create a quiz based on these parameters:
      subject: #{quiz_params[:subject]},
      topic: #{quiz_params[:topic]},
      grade level: #{quiz_params[:level]},
      difficulty: #{quiz_params[:difficulty]},
      objectives: #{quiz_params[:objectives]},
      format: #{quiz_params[:format]},
      number of questions: #{quiz_params[:numberOfQuestions]}
    "
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: 'You are a quiz generator. Based on user input, return only a string in JSON with this structure (do not include any other extra text):
              {
                "title": "",
                "description": "",
                "questions": [{
                  "type": "",
                  "question": "",
                  "choices": [""],
                  "correctAnswer": ""
                }]
              }'},
            { role: "user", content: prompt}
          ]
      })

    if response.success?
      response_content = response.dig("choices", 0, "message", "content")
      jsonResponse = JSON.parse(response_content)
      if jsonResponse
        @quiz = Quiz.new(
          user: current_user,
          subject: quiz_params[:subject],
          topic: quiz_params[:topic],
          level: quiz_params[:level],
          difficulty: quiz_params[:difficulty],
          objectives: quiz_params[:objectives],
          format: quiz_params[:format],
          numberOfQuestions: quiz_params[:numberOfQuestions],
          prompt: prompt,
          response: jsonResponse
          )

        respond_to do |format|
          if @quiz.save
            format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully generated." }
            format.json { render :show, status: :ok, location: @quiz }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @quiz.errors, status: :unprocessable_entity }
          end
        end
      else
        error_message = response.body["message"]
        redirect_to new_quiz_path, alert: "Failed to generate quiz: #{error_message}"
      end
    else
      error_message = response.body["message"]
      redirect_to new_quiz_path, alert: "Failed to generate quiz: #{error_message}"
    end
  end

  # def create
  #   response_content = '{
  #     "title": "Geography Quiz",
  #     "description": "Test your knowledge of world geography",
  #     "questions": [
  #     {
  #     "type": "multiple-choice",
  #     "question": "What is the capital of France?",
  #     "choices": [
  #     "London",
  #     "Paris",
  #     "Rome",
  #     "Berlin"
  #     ],
  #     "correctAnswer": "Paris"
  #     },
  #     {
  #     "type": "checkbox",
  #     "question": "Which of the following are continents?",
  #     "choices": [
  #     "Africa",
  #     "India",
  #     "South America",
  #     "Russia",
  #     "Europe"
  #     ],
  #     "correctAnswer": [
  #     "Africa",
  #     "South America",
  #     "Europe"
  #     ]
  #     },
  #     {
  #     "type": "grid",
  #     "question": "Rate your familiarity with the following languages",
  #     "rows": [
  #     "Spanish",
  #     "Mandarin",
  #     "Arabic"
  #     ],
  #     "columns": [
  #     "Never heard of it",
  #     "Familiar",
  #     "Fluent"
  #     ]
  #     },
  #     {
  #     "type": "date",
  #     "question": "When did World War II begin?",
  #     "correctAnswer": "1939-09-01"
  #     }
  #     ]
  #     }'
  #   puts JSON.parse(response_content)

  # end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  # def update
  #   respond_to do |format|
  #     if @quiz.update(quiz_params)
  #       format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated." }
  #       format.json { render :show, status: :ok, location: @quiz }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @quiz.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:subject, :topic, :level, :objectives, :format, :numberOfQuestions, :difficulty)
    end
end
