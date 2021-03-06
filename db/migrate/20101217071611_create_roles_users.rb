class CreateRolesUsers < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
      t.timestamps
    end
    add_index :roles_users, [:role_id, :user_id]
    add_index :roles_users, :user_id
  end

  def self.down
    drop_table :roles_users
  end
end
