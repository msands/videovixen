class RemoveEthnicityFromVixenProfiles < ActiveRecord::Migration
  def change
    remove_column :vixen_profiles, :ethnicity, :string
  end
end
