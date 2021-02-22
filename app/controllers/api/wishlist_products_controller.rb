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
end
  