class AddColToJobInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :job_informations, :image, :string
  end
end
