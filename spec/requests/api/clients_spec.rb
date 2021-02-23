require 'rails_helper'

RSpec.describe "Clients API", type: :request do
	let(:headers) do
		post "/api/login", params:{username: "admin", password: "password"}
		auth_token = JSON.parse(response.body)["token"]
		
		return {"Authorization": "Bearer #{auth_token}"}
	end
	
	context "create" do
		let(:client_params){{name: "João", email: "joao@gmail.com"}}
		let(:duplicated_client_params){{email: "joao@gmail.com"}}
		
		before do
			post "/api/clients", params: {client: client_params}, headers: headers
		end

		it "return the created client" do
			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João")
		end

		it "avoid duplicated emails" do
			post "/api/clients", params: {client: duplicated_client_params}, headers: headers
			expect(response.status).to eq(400)
		end
	end

	context "show" do
		let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}

		it "return client" do
			get "/api/clients/#{client_id}", headers: headers

			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João")
		end
	end

	context "update" do
		let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}
		let(:client_params){{name: "João da Silva", email: "joao_da_silva@gmail.com"}}

		it "return the updated client" do
			put "/api/clients/#{client_id}", params: {client: client_params}, headers: headers

			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João da Silva")
			expect(json['data']['attributes']['email']).to eq("joao_da_silva@gmail.com")
		end
	end

	context "delete" do
		let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}

		it "remove the client" do
			delete "/api/clients/#{client_id}", headers: headers
			client_exist = Client.where(id: client_id).count == 1
			expect(client_exist).to be_falsey
		end
	end
end