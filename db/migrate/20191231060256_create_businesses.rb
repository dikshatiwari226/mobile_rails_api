class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :person_name
      t.string :business_name
      t.string :business_gst_number

      t.timestamps
    end
  end
end
