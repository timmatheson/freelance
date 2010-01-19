class ProjectsController < ApplicationController
  before_filter :login_required
  before_filter :check_clients_exist, :only => [:new,:edit]
  before_filter :find_client, :if => Proc.new{ |c| c.params[:client_id] }
  
  def index
    @projects = @client.projects if @client
    @projects = Project.all unless @projects
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    if @client
      @project = @client.projects.build
    else
      @project = Project.new
    end
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Successfully created project."
      redirect_to @project
    else
      render :action => 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to @project
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Successfully destroyed project."
    redirect_to projects_url
  end
  
  private
  
  def find_client
    @client = Client.find(params[:client_id])
  end
  
  def check_clients_exist
    if Client.count == 0
      flash[:error] = "Please create a client first."
      redirect_to new_client_path
    end
  end
end
