class Project < ActiveRecord::Base
  belongs_to :customer
  has_many :contracts, :dependent => :destroy

  has_many :tasks
  has_many :implementors, :through => :tasks, :source => :owner 

  named_scope :actives, :conditions => {:active => true}
  named_scope :inactives, :conditions => {:active => false}

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :customer_id
end
