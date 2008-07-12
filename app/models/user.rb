class User < ActiveRecord::Base
  
  OPTIONS_FOR_KIND = %w(administrator user)
 
  cattr_accessor :current_user_id 
 
  has_many :tasks, :foreign_key => :owner_id
  has_many :contracts, :foreign_key => "leader_id" 

  validates_presence_of :name
  validates_presence_of :login
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :login, :within => 5..16
  validates_length_of :password, :within => 5..255
  validates_inclusion_of :kind, :in => OPTIONS_FOR_KIND

  def password=(p) 
    self[:password] = p unless p.blank? 
  end 

end