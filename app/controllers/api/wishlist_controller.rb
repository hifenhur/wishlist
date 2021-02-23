class Api::WishlistController < ApplicationController
    def index
        client = Client.find(params[:client_id])

        wishlist_products = client.wishlist_products
        
        if wishlist_products
            render json: WishlistProductSerializer.new(wishlist_products)
        else
            render json: {error_messages: wishlist_product.errors.messages}, status: 400
        end
    end
end
  