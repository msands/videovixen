class DropWorksTable < ActiveRecord::Migration
  def up
    remove_column :vixen_profile, :work, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
