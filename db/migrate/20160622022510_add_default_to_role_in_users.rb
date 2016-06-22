class AddDefaultToRoleInUsers < ActiveRecord::Migration
  def change
      change_column_default :users, :role, 'talent'
      change_column_null :users, :role, false, 'talent'
  end
end
