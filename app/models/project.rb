class Project < ActiveRecord::Base
  belongs_to :client
  has_many :users, :through => :tickets
  has_many :tickets, :dependent => :destroy
  has_many :contacts, :through => :client
  
  def title_with_company
    [client.company_name, title].join(" - ")
  end
  
  def collaborators
    users.map(&:fullname).uniq.join(", ")
  end
  
  def due_date
    due_at.strftime("%m/%d/%Y <small>(at %H:%M %p)</small>")
  end
  
  def past_due?
    due_at < Time.now
  end
end
