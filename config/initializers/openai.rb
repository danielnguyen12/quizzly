OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.openai.api_key
  # config.organization_id = ENV.fetch('OPENAI_ORGANIZATION_ID')
end