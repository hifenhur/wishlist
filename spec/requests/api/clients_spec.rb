require 'rails_helper'

RSpec.describe "Clients API", type: :request do
	context "create" do
		let(:client_params){{name: "João", email: "joao@gmail.com"}}
		let(:duplicated_client_params){{email: "joao@gmail.com"}}
		
		before do
			post "/api/clients", params: {client: client_params}
		end

		it "return the resource" do
			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João")
		end

		it "avoid duplicated emails" do
			post "/api/clients", params: {client: duplicated_client_params}
			expect(response.status).to eq(400)
		end
	end

	context "show" do
		let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}

		it "return the resource" do
			get "/api/clients/#{client_id}"

			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João")
		end
	end

	context "update" do
		let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}
		let(:client_params){{name: "João da Silva", email: "joao_da_silva@gmail.com"}}

		it "return the updated resource" do
			put "/api/clients/#{client_id}", params: {client: client_params}

			json = JSON.parse(response.body)
			expect(json['data']['attributes']['name']).to eq("João da Silva")
			expect(json['data']['attributes']['email']).to eq("joao_da_silva@gmail.com")
		end
	end
end