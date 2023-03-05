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
  def create
    @ai_story = AiStory.new(ai_story_params)

    respond_to do |format|
      if @ai_story.save
        format.html { redirect_to ai_story_url(@ai_story), notice: "Ai story was successfully created." }
        format.json { render :show, status: :created, location: @ai_story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_story.errors, status: :unprocessable_entity }
      end
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
