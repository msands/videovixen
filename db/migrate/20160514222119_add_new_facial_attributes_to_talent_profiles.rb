class AddNewFacialAttributesToTalentProfiles < ActiveRecord::Migration
  def change
    add_column :talent_profiles, :eye_color, :string
    add_column :talent_profiles, :hair_color, :string
    add_column :talent_profiles, :hair_length, :string
    add_column :talent_profiles, :hair_type, :string
    add_column :talent_profiles, :skills, :string
    add_column :talent_profiles, :languages, :string, array: true
  end
end
