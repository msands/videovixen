class CreateVixenProfiles < ActiveRecord::Migration
  def change
    create_table :vixen_profiles do |t|
      t.boolean :gender
      t.date :birthday
      t.string :location
      t.integer :height
      t.integer :weight
      t.integer :bust
      t.integer :waist
      t.integer :hips
      t.string :cup
      t.integer :dress
      t.string :ethnicity
      t.string :experience
      t.string :work
      t.integer :rate
      t.boolean :travel
      t.string :hair_makeup
      t.boolean :wardrobe
      t.text :bio

      t.timestamps null: false
    end
  end
end
