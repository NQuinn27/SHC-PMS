json.extract! icd10, :id, :created_at, :updated_at, :code, :description, :additional
json.url icd10_url(icd10, format: :json)
