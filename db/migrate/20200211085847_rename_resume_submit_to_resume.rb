class RenameResumeSubmitToResume < ActiveRecord::Migration[5.2]
  def change
  	add_column :applied_jobs, :resume, :string
  	remove_column :applied_jobs, :resume_submit, :boolean
  end
end
