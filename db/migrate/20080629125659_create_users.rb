class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :login, :limit => 16, :null => false
      t.string :password, :limit => 255, :null => false
      t.string :kind, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
