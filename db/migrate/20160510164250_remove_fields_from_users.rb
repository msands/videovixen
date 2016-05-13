class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_pic_file_name, :string
    remove_column :users, :profile_pic_content_type, :string
    remove_column :users, :profile_pic_file_size, :integer
    remove_column :users, :profile_pic_updated_at, :datetime
  end
end
