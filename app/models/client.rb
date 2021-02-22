# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
	validates_uniqueness_of :email
	has_many :wishlist_products

	def product_from_api(id)
		wishlist_product = self.wishlist_products.new
		wishlist_product.initialize_using_api_product_id(id)
		
		return wishlist_product
	end
	
end
