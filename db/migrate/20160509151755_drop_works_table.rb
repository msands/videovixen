class DropWorksTable < ActiveRecord::Migration
  def up
    drop_column :works
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
