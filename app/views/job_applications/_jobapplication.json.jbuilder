json.extract! job_application, :id, :name, :email, :description, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
