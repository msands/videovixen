class AddAttachmentProfilePicToVixenProfiles < ActiveRecord::Migration
  def self.up
    change_table :vixen_profiles do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :vixen_profiles, :profile_pic
  end
end
