class ChangeVixenProfilesGender < ActiveRecord::Migration
  def up
    change_table :vixen_profiles do |t|
      t.change :gender, :string
    end
  end

  def down
    change_table :vixen_profiles do |t|
      t.change :gender, :boolean
    end
  end
end
