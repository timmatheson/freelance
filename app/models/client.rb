class Client < ActiveRecord::Base
  has_many :projects, :dependent => :destroy
  has_many :tickets, :through => :projects
  has_and_belongs_to_many :contacts
end
