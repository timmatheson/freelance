module TicketsHelper
  def tickets_by_status_select(params)
    select_tag "action", ([:all] | Ticket.states).collect { |state| 
      "<option value='#{state.to_s}' #{params[:action] == state.to_s ? %(selected='selected') : nil}>#{state.to_s.titleize}</option>"
    }.join, {:id => "action", :onchange => %(document.location.href = '/tickets/' + $('action').value)}
  end
end
