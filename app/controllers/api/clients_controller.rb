class Api::ClientsController < ApplicationController
  before_action :setup_client, only:[:update, :destroy, :show]
  def create
  	client = Client.new(permitted_client_params)
  	
  	if client.save
  		render json: ClientSerializer.new(client)
  	else
		  render json: {error_messages: client.errors.messages}, status: 400
  	end
  end

  def update
    if @client.update(permitted_client_params)
  		render json: ClientSerializer.new(@client)
  	else
		  render json: {error_messages: @client.errors.messages}, status: 400
  	end
    
  end

  def destroy
    if @client.destroy
      render status: 200
    else
      render status: 400
    end

  end

  def show
    render json: ClientSerializer.new(@client)
  end
  
  private
  def setup_client
    @client = Client.find(params[:id])
  end
  
  def permitted_client_params
      params.require(:client).permit(:name, :email)
    end
end
