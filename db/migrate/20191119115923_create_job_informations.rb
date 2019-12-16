class CreateJobInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :job_informations do |t|
      t.string :job_title
      t.string :company_name
      t.string :job_description
      t.string :company_location
      t.datetime :post_date

      t.timestamps
    end
  end
end
