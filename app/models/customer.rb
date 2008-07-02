class Customer < ActiveRecord::Base
  has_many :projects, :dependent => :destroy
  has_many :contracts, :through => :projects

  validates_presence_of :name
  validates_presence_of :description
  validates_uniqueness_of :name
  validates_inclusion_of :rating, :in => 1..5

  validates_numericality_of :phone_country_code
  validates_numericality_of :phone_area_code
  validates_format_of :phone_number, :with => /^(\d|\s|-)+$/
  composed_of :phone, :class_name => "Phone",
    :mapping => [
      %w(phone_country_code),
      %w(phone_area_code),
      %w(phone_number),
    ]
end
