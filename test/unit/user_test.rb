require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users, :roles
  
  def test_should_not_be_admin
    u = users(:one)
    assert_equal u.has_role?("admin"),false
  end
  
  def test_should_be_admin
    u = users(:one)
    u.add_role("admin")
    assert u.has_role?("admin")
  end
  
  def test_should_return_true_when_admin
    u = users(:one)
    u.add_role("admin")
    assert u.admin?
  end
end
