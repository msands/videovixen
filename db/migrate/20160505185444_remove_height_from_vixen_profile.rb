class RemoveHeightFromVixenProfile < ActiveRecord::Migration
  def change
    remove_column :vixen_profiles, :height, :integer
  end
end
