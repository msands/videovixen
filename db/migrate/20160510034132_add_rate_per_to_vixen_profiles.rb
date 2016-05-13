class AddRatePerToVixenProfiles < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :rate_per, :string
  end
end
