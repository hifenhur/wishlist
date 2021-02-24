class Api::WishlistProductsController < ApplicationController
    def create
        client = Client.find(params[:client_id])

        wishlist_product = client.product_from_api(params[:product_id])
        
        if wishlist_product.save
            render json: WishlistProductSerializer.new(wishlist_product)
        else
            render json: {error_messages: wishlist_product.errors.messages}, status: 400
        end
    end

    def destroy
        client = Client.find(params[:client_id])

        wishlist_product = client.wishlist_products.find_by_api_product_id(params[:product_id])
        if wishlist_product.destroy
            render status: 200
        else
            render status: 400
        end
    end
end
  