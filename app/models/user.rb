class User < ActiveRecord::Base
  acts_as_authentic
  has_and_belongs_to_many :roles
  has_many :tickets
  
  validates_presence_of :firstname, :lastname
  
  def fullname
    [firstname,lastname].join(" ")
  end
  
  def has_role?(role)
    self.roles.include?(Role.find_by_name(role))
  end
  
  def admin?
    @admin ||= has_role?("admin")
  end
  
  def add_role(name_or_role)
    if name_or_role.is_a?(Role)
      name = name_or_role.name
      self.roles << name_or_role
    else
      name = name_or_role
      self.roles << Role.find_by_name(name_or_role)
    end
    has_role?(name_or_role)
  end
end
