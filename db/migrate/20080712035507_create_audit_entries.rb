class CreateAuditEntries < ActiveRecord::Migration
  def self.up
    create_table :audit_entries do |t|
      t.references :user 
      t.string :model_name 
      t.string :operation 
      t.datetime :created_at 
      t.text :changes
    end
  end

  def self.down
    drop_table :audit_entries
  end
end
