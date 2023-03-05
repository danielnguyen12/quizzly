json.extract! ai_story, :id, :prompt, :user_id, :response, :created_at, :updated_at
json.url ai_story_url(ai_story, format: :json)
