class DropWorksTable < ActiveRecord::Migration
  def up
    remove_column :work
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
