# == Schema Information
#
# Table name: wishlist_products
#
#  id             :bigint           not null, primary key
#  brand          :string
#  image          :string
#  price          :integer
#  review_score   :float
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  api_product_id :uuid
#  client_id      :bigint           not null
#
# Indexes
#
#  index_wishlist_products_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
class WishlistProduct < ApplicationRecord
  belongs_to :client
  validates :api_product_id, uniqueness: { scope: :client_id }

  attr_accessor :remote_api_product_data

  validate :product_exists, on: :create
  
  def initialize_using_api_product_id(id)
    product_response = HTTParty.get("http://challenge-api.luizalabs.com/api/product/#{id}/")
    @remote_api_product_data = JSON.parse(product_response.body)

    
    unless @remote_api_product_data["error_message"]
      self.brand = @remote_api_product_data["brand"]
      self.image = @remote_api_product_data["image"]
      self.price = @remote_api_product_data["price"]
      self.title = @remote_api_product_data["title"]
      self.review_score = @remote_api_product_data["reviewScore"]
      self.api_product_id = @remote_api_product_data["id"]
    end
  end

  def product_exists
    if @remote_api_product_data["error_message"]
      self.errors.add(:api_product_error, @remote_api_product_data["error_message"])
    end
  end
end
