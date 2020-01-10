class ChangeProfileTablesToProfile < ActiveRecord::Migration[5.2]
  def change
  	rename_table :profile_tables, :profiles
  end
end
