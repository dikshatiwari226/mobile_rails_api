class AddColToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :contact, :string
    add_column :users, :dob, :string
    add_column :users, :address, :string
    add_column :users, :profession, :string
  end
end
