class ClientsController < ApplicationController
  before_filter :login_required
  
  def index
    @clients = Client.all
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "Successfully created client."
      redirect_to @client
    else
      render :action => 'new'
    end
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:notice] = "Successfully updated client."
      redirect_to @client
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Successfully destroyed client."
    redirect_to clients_url
  end
end
