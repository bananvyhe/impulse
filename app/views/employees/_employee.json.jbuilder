json.extract! employee, :id, :name, :spec, :desc, :prof, :avatar, :created_at, :updated_at
json.url employee_url(employee, format: :json)
