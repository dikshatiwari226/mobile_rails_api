class AppliedJob < ApplicationRecord

	APP_STATUS = {1 => "Pending", 2 => "Complited"}

  def application_status_display
  	AppliedJob::APP_STATUS[application_status]
  end

  mount_uploader :resume, ImageUploader
end
