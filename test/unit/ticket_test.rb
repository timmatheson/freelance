require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ticket.new.valid?
  end
end
