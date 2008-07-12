class AuditEntry < ActiveRecord::Base
  validates_presence_of :user_id, :model_name, :created_at, :changes 
  validates_inclusion_of :operation, :in => %w(insert update delete) 

  belongs_to :user 
end
