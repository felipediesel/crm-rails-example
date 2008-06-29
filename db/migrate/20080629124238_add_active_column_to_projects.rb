class AddActiveColumnToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :active, :boolean
  end

  def self.down
    remove_column :projects, :active
  end
end
