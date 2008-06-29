class CreateProjectsMembers < ActiveRecord::Migration
  def self.up
    create_table :projects_members, :id => false do |t|
      t.references :project, :null => false
      t.references :member, :null => false
    end
  end
  def self.down
    drop_table :projects_members
  end
end
