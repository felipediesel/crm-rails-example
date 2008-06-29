class Customer < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_uniqueness_of :name
  validates_format_of :phone, :with => /^(\d|\s)*$/
  validates_inclusion_of :rating, :in => 1..5 

end
