class AddFieldsToVixenProfile < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :height_feet, :integer
    add_column :vixen_profiles, :height_inches, :integer
  end
end
