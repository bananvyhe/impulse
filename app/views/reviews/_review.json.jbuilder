json.extract! review, :id, :name, :subj, :created_at, :updated_at
json.url review_url(review, format: :json)
