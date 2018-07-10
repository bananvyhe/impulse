json.extract! feedback, :id, :name, :contact, :message, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
