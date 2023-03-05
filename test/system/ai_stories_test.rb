require "application_system_test_case"

class AiStoriesTest < ApplicationSystemTestCase
  setup do
    @ai_story = ai_stories(:one)
  end

  test "visiting the index" do
    visit ai_stories_url
    assert_selector "h1", text: "Ai stories"
  end

  test "should create ai story" do
    visit ai_stories_url
    click_on "New ai story"

    fill_in "Prompt", with: @ai_story.prompt
    fill_in "Response", with: @ai_story.response
    fill_in "User", with: @ai_story.user_id
    click_on "Create Ai story"

    assert_text "Ai story was successfully created"
    click_on "Back"
  end

  test "should update Ai story" do
    visit ai_story_url(@ai_story)
    click_on "Edit this ai story", match: :first

    fill_in "Prompt", with: @ai_story.prompt
    fill_in "Response", with: @ai_story.response
    fill_in "User", with: @ai_story.user_id
    click_on "Update Ai story"

    assert_text "Ai story was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai story" do
    visit ai_story_url(@ai_story)
    click_on "Destroy this ai story", match: :first

    assert_text "Ai story was successfully destroyed"
  end
end
