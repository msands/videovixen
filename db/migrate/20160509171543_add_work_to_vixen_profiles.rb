class AddWorkToVixenProfiles < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :work, :string, array: true
  end
end
