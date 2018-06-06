json.extract! contact, :id, :mail, :adress, :tel, :map, :created_at, :updated_at
json.url contact_url(contact, format: :json)
