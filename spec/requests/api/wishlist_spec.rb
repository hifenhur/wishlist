require 'rails_helper'

RSpec.describe "Wishlist API", type: :request do
	context "add product to client" do
        let(:client_id){Client.create(name: "João", email: "joao@gmail.com").id}
		let(:invalid_product_id){
			"invalid_key"
		}
		let(:valid_product){
			response = HTTParty.get("http://challenge-api.luizalabs.com/api/product/?page=1")
			JSON.parse(response.body)["products"][0]
		}

		it "returns error when product doesn't exists" do
			post "/api/clients/#{client_id}/wishlist_products/#{invalid_product_id}"
			
			expect(response.status).to eq(400)
		end

		it "create a product into client wishlist" do
			post "/api/clients/#{client_id}/wishlist_products/#{valid_product['id']}" 

			json = JSON.parse(response.body)
			expect(json['data']['attributes']['brand']).to eq(valid_product["brand"])
		end

		it "avoid add duplicated product" do
			client = Client.find(client_id)
			product = client.product_from_api(valid_product["id"])
			product.save
			
			post "/api/clients/#{client_id}/wishlist_products/#{valid_product['id']}" 

			expect(response.status).to eq(400)
		end
	end

	
end