class ChangeToAppliedJobs < ActiveRecord::Migration[5.2]
  def change
  	change_column :applied_jobs, :application_status, :string
  end
end
