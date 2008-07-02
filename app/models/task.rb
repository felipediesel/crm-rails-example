class Task < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  belongs_to :project

  OPTIONS_FOR_STATUS = %w(open closed)
  OPTIONS_FOR_PRIORITY = %w(normal low high)

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :owner_id
  validates_presence_of :project_id
  validates_numericality_of :progress, :only_integer => true, :allow_nil => true
  validates_inclusion_of :status, :in => OPTIONS_FOR_STATUS
  validates_inclusion_of :priority, :in => OPTIONS_FOR_PRIORITY

  named_scope :with_status, lambda { |s| { :conditions => { :status => s.to_s } } }

  after_create :register_create
  after_update :register_update

  #def started_at=(date)
  #  write_attribute(:started_at, date.match(/([0-9]{2})\/([0-9]{2})\/([0-9]{4})/)[1..3].reverse * "-")
  #end
  #
  #def started_at
  #  if read_attribute(:started_at).nil?
  #    Time.now.strftime('%d/%m/%Y')
  #  else
  #    read_attribute(:started_at).strftime('%d/%m/%Y')
  #  end
  #end

  def register_create
    Log.create(:message => "Task: '#{self.title}' created by '#{self.owner.name}'.")
  end

  def register_update
    Log.create(:message => "Task '#{self.title}' updated by '#{self.owner.name}'.")
  end

  class << self
    def find_high(options = {})
      with_priority("high") do
        find(:all, options)
      end
    end

    def find_low(options = {})
      with_priority("normal") do
        find(:all, options)
      end
    end

    def find_normal(options = {})
      with_priority("normal") do
        find(:all, options)
      end
    end

    def with_priority(priority)
      with_scope(:find => {:conditions => {:priority => priority}}) do
        yield
      end
    end
  end
end
