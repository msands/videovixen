class AddUserIdToDirectorProfiles < ActiveRecord::Migration
  def change
    add_column :director_profiles, :user_id, :integer
  end
end
