require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def test_has_and_belongs_to_many_clients
    assert Contact.new.respond_to?(:clients)
  end
end
