require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ticket.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ticket.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Ticket.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ticket_url(assigns(:ticket))
  end
  
  def test_edit
    get :edit, :id => Ticket.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ticket.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ticket.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Ticket.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ticket.first
    assert_redirected_to ticket_url(assigns(:ticket))
  end
  
  def test_destroy
    ticket = Ticket.first
    delete :destroy, :id => ticket
    assert_redirected_to tickets_url
    assert !Ticket.exists?(ticket.id)
  end
end
