require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def test_has_and_belongs_to_many_contacts
    assert Client.new.respond_to?(:contacts)
  end
end
