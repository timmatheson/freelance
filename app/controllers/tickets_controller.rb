class TicketsController < ApplicationController
  before_filter :login_required
  before_filter :check_projects_exist, :only => [:new,:edit]
  
  uses_tiny_mce(:options => { :theme => 'advanced',
  :browsers => %w{ msie gecko},
  :mode => "textareas",
  :theme_advanced_toolbar_location => "top",
  :theme_advanced_toolbar_align => "left",
  :theme_advanced_resizing => true,
  :theme_advanced_resize_horizontal => false,
  :paste_auto_cleanup_on_paste => true,
  :theme_advanced_buttons1 => %w{ code formatselect fontselect fontsizeselect boldbullist numlist forecolor backcolor separator link unlink image undo redo},
  :theme_advanced_buttons2 => [],
  :theme_advanced_buttons3 => [],
  :theme_advanced_buttons3_add => %w{ tablecontrols fullscreen},
  :editor_selector => 'mceEditor',
  :plugins => %w{ contextmenu paste table fullscreen } })
  
  def index
    @tickets = Ticket.find(:all, :include => [:project])
  end
  
  def all
    @tickets = Ticket.find(:all, :include => [:project])
    render :action => "index"
  end
  
  Ticket.states.each do |s|
    define_method(s) do
      @tickets = Ticket.send(params[:action].to_sym)
      render :action => "index"
    end
  end
  
  def accept
    @ticket = Ticket.find(params[:id])
    if @ticket.accept!
      flash[:notice] = "Ticket was accepted."
      redirect_to ticket_path(@ticket)
    end
  end
  
  def show
    @ticket = Ticket.find(params[:id], :include => [:project])
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      flash[:notice] = "Successfully created ticket."
      redirect_to @ticket
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ticket = Ticket.find(params[:id], :include => [:project])
  end
  
  def update
    @ticket = Ticket.find(params[:id], :include => [:project])
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Successfully updated ticket."
      redirect_to @ticket
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:notice] = "Successfully destroyed ticket."
    redirect_to tickets_url
  end
  
  private
  
  def check_projects_exist
    if Project.count == 0
      flash[:error] = "Please create a project first."
      redirect_to new_project_path
    end
  end
end
