class CreateProfileTable < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_tables do |t|
      t.string :name
      t.string :email
      t.string :jobTitle
      t.string :gender
      t.integer :contact

      t.timestamps
    end
  end
end
