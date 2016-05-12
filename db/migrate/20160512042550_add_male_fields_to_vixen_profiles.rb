class AddMaleFieldsToVixenProfiles < ActiveRecord::Migration
  def change
    add_column :vixen_profiles, :shoe, :integer
    add_column :vixen_profiles, :inseam, :integer
    add_column :vixen_profiles, :chest, :integer
    add_column :vixen_profiles, :suit, :integer
    add_column :vixen_profiles, :glove, :integer
    add_column :vixen_profiles, :hat, :integer
  end
end
