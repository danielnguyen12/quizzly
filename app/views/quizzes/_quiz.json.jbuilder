json.extract! quiz, :id, :user_id, :subject, :topic, :level, :objectives, :format, :length, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
