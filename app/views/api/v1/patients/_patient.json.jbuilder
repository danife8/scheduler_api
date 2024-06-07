json.extract! patient, :id, :name, :lastname, :email, :phone, :specialty, :created_at, :updated_at
json.url patient_url(patient, format: :json)
