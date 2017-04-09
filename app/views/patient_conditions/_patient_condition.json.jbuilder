json.extract! patient_condition, :id, :patient_id, :doctor_id, :reported, :cured, :notes, :condition_id, :created_at, :updated_at
json.url patient_condition_url(patient_condition, format: :json)
