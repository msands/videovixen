class ChangeVixenProfileTableName < ActiveRecord::Migration
  def change
    rename_table :vixen_profiles, :talent_profiles
  end
end
