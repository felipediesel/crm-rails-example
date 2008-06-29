class Project < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :customer_id
end
