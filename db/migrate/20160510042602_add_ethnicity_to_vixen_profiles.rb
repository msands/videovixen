class AddEthnicityToVixenProfiles < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :ethnicity, :string, array: true
  end
end
