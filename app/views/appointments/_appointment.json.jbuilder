json.extract! appointment, :id, :doctor_id, :patient_id, :date, :notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
