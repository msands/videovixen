class CreateDirectorProfiles < ActiveRecord::Migration
  def change
    create_table :director_profiles do |t|
      t.string :gender
      t.string :location
      t.string :experience
      t.string :compensation
      t.string :categories, array: true
      t.text :bio

      t.timestamps null: false
    end
  end
end
