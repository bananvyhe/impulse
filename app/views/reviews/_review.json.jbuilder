json.extract! review, :id, :name, :subj, :position, :katbib_id, :created_at, :updated_at
json.url review_url(review, format: :json)
