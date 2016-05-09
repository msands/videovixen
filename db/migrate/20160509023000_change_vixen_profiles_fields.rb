class ChangeVixenProfilesFields < ActiveRecord::Migration
  def up
    change_table :vixen_profiles do |t|
      t.change :travel, :string
      t.change :wardrobe, :string
    end
  end

  def down
    change_table :vixen_profiles do |t|
      t.change :travel, :boolean
      t.change :wardrobe, :boolean
    end
  end
end
