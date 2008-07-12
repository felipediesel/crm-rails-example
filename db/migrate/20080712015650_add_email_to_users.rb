class AddEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string 
    User.reset_column_information 
    User.update_all "email = 'admin@example.org'" 
  end

  def self.down
    remove_column :users, :email 
  end
end
