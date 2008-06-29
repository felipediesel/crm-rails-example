class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :name, :null => false
      t.string :code, :null => false
      t.text :description, :null => false
      t.string :status, :null => false
      t.datetime :started_at, :null => false
      t.datetime :ended_at
      t.float :value
      t.references :leader, :null => false
      t.references :project, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
