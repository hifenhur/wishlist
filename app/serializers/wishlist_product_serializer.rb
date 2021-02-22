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
class WishlistProductSerializer
    include JSONAPI::Serializer
    attributes :id, :brand, :image, :price, :title
end
  
