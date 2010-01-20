# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_user
    @current_user_session
  end
  
  def current_layout(controller)
    columns = { :two => "span-16", :one => "span-24" }
    actions = ([:index,:all] | Ticket.states).map(&:to_s).join("|")
    controller.action_name =~ /^(#{actions})$/ ? columns[:one] : columns[:two]
  end
  
  def cancel_button
    button_to_function "Cancel", %(javascript:history.go(-1);), :class => "button", :method => :get
  end
  
  def current(controller)
    @controller.controller_name == controller ? "current" : ""
  end
  
end
