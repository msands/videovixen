class AddBicepToVixenProfiles < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :bicep, :integer
  end
end
