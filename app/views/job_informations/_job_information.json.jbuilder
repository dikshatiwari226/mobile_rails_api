json.extract! job_information, :id, :job_title, :company_name, :job_description, :company_location, :post_date, :created_at, :updated_at
json.url job_information_url(job_information, format: :json)
