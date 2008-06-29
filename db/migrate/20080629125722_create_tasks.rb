class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :status, :null => false
      t.references :owner, :null => false
      t.string :priority, :null => false
      t.integer :progress
      t.datetime :started_at
      t.datetime :ended_at
      t.references :project, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
