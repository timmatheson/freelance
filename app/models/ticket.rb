class Ticket < ActiveRecord::Base
  belongs_to :project
  has_one :client, :through => :project
  belongs_to :user
  
  acts_as_state_machine :initial => :open
  state :open
  state :accepted
  state :closed
  state :verified
  
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
