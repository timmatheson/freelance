class User < ActiveRecord::Base
  acts_as_authentic
  has_many :tickets
  
  def fullname
    [firstname,lastname].join(" ")
  end
end
