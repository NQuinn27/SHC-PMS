json.extract! hospital, :id, :name, :address, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
