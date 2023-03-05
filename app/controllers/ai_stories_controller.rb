class AiStoriesController < ApplicationController
  before_action :set_ai_story, only: %i[ show edit update destroy ]

  # GET /ai_stories or /ai_stories.json
  def index
    @ai_stories = AiStory.all
  end

  # GET /ai_stories/1 or /ai_stories/1.json
  def show
  end

  # GET /ai_stories/new
  def new
    @ai_story = AiStory.new
  end

  # GET /ai_stories/1/edit
  def edit
  end

  # POST /ai_stories or /ai_stories.json
  # def create
  #   client = OpenAI::Client.new
  #   prompt = ai_story_params[:prompt]
  #   response = client.chat(
  #     parameters: {
  #         model: "gpt-3.5-turbo",
  #         messages: [{ role: "user", content: prompt}],
  #     })

  #   if response.success?
  #     puts response.dig("choices", 0, "message", "content")
  #     @response_content = response.dig("choices", 0, "message", "content")
  #     @ai_story = AiStory.new(user: current_user, prompt: prompt, response: @response_content)

  #     if @ai_story.save
  #       redirect_to ai_stories_path, notice: 'AI Story was successfully created.'
  #     else
  #       render :new, notice: :unprocessable_entity
  #     end
  #   else
  #     error_message = response.body["message"]
  #     redirect_to new_ai_story_path, alert: "Failed to generate story: #{error_message}"
  #   end
  # end

  def create # for testing without charges
    prompt = ai_story_params[:prompt]

    if prompt
      @response_content = 'This is filler text.'
      @ai_story = AiStory.new(user: current_user, prompt: prompt, response: @response_content)

      if @ai_story.save
        redirect_to ai_stories_path, notice: 'AI Story was successfully created.'
      else
        render :new, notice: :unprocessable_entity
      end
    else
      error_message = response.body["message"]
      redirect_to new_ai_story_path, alert: "Failed to generate story: #{error_message}"
    end
  end

  # PATCH/PUT /ai_stories/1 or /ai_stories/1.json
  def update
    respond_to do |format|
      if @ai_story.update(ai_story_params)
        format.html { redirect_to ai_story_url(@ai_story), notice: "Ai story was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_stories/1 or /ai_stories/1.json
  def destroy
    @ai_story.destroy

    respond_to do |format|
      format.html { redirect_to ai_stories_url, notice: "Ai story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_story
      @ai_story = AiStory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_story_params
      params.require(:ai_story).permit(:prompt, :user_id, :response)
    end
end
