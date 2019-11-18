json.extract! applied_job, :id, :position, :company, :application_no, :date_applied, :application_status, :resume_submit, :created_at, :updated_at
json.url applied_job_url(applied_job, format: :json)
