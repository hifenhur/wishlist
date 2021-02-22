class Api::ClientsController < ApplicationController
  def create
  	client = Client.new(permitted_client_params)
  	
  	if client.save
  		render json: ClientSerializer.new(client)
  	else
		  render json: {error_messages: client.errors.messages}, status: 400
  	end
  end

  def update
    client = Client.find(params[:id])
    
    if client.update(permitted_client_params)
  		render json: ClientSerializer.new(client)
  	else
		  render json: {error_messages: client.errors.messages}, status: 400
  	end
    
  end

  def show
    client = Client.find(params[:id])

    render json: ClientSerializer.new(client)
  end
  
  private
  def permitted_client_params
      params.require(:client).permit(:name, :email)
    end
end
