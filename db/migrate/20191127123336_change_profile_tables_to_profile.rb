class ChangeProfileTablesToProfile < ActiveRecord::Migration[5.2]
  def change
  	rename_table :profile, :profiles
  end
end
