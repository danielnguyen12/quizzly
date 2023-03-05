require "test_helper"

class AiStoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_story = ai_stories(:one)
  end

  test "should get index" do
    get ai_stories_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_story_url
    assert_response :success
  end

  test "should create ai_story" do
    assert_difference("AiStory.count") do
      post ai_stories_url, params: { ai_story: { prompt: @ai_story.prompt, response: @ai_story.response, user_id: @ai_story.user_id } }
    end

    assert_redirected_to ai_story_url(AiStory.last)
  end

  test "should show ai_story" do
    get ai_story_url(@ai_story)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_story_url(@ai_story)
    assert_response :success
  end

  test "should update ai_story" do
    patch ai_story_url(@ai_story), params: { ai_story: { prompt: @ai_story.prompt, response: @ai_story.response, user_id: @ai_story.user_id } }
    assert_redirected_to ai_story_url(@ai_story)
  end

  test "should destroy ai_story" do
    assert_difference("AiStory.count", -1) do
      delete ai_story_url(@ai_story)
    end

    assert_redirected_to ai_stories_url
  end
end
