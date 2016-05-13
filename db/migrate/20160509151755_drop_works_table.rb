class DropWorksTable < ActiveRecord::Migration
  def up
    remove_column :works
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
