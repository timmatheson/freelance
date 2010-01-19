# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_user
    @current_user_session
  end
  
  def current_layout(controller)
    columns = { :two => "span-16", :one => "span-24" }
    controller.action_name =~ /^index$/ ? columns[:one] : columns[:two]
  end
end
