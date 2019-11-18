class CreateAppliedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applied_jobs do |t|
      t.integer :position
      t.string :company
      t.string :application_no
      t.datetime :date_applied
      t.boolean :application_status
      t.boolean :resume_submit

      t.timestamps
    end
  end
end
