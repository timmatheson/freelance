class Ticket < ActiveRecord::Base
  belongs_to :project
  has_one :client, :through => :project
  belongs_to :user
  
  validates_presence_of :title, :description
  validates_presence_of :user, :message => "Ticket must be assigned to someone."
  validates_presence_of :project, :message => "Ticket must be assigned to a project."
  
  
  acts_as_state_machine :initial => :open
  state :open
  state :accepted
  state :closed
  state :verified
  
  named_scope :open, :conditions => {:state => "open"}
  named_scope :accepted, :conditions => {:state => "accepted"}
  named_scope :closed, :conditions => {:state => "closed"}
  named_scope :verified, :conditions => {:state => "verified"}
  
  event :accept do
    transitions :from => :open, :to => :accepted
  end
  
  event :close do
    transitions :from => [:open, :accepted], :to => :closed
  end
  
  event :verify do
    transitions :from => :closed, :to => :verified
  end
end
