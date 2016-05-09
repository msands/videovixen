class RemoveWorkFromVixenProfiles < ActiveRecord::Migration
  def change
    remove_column :vixen_profiles, :work, :string
  end
end
