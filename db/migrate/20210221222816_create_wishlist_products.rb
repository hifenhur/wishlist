class CreateWishlistProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlist_products do |t|
      t.references :client, null: false, foreign_key: true
      t.uuid :api_product_id
      t.string :brand
      t.string :title
      t.string :image
      t.float :review_score
      t.integer :price

      t.timestamps
    end
  end
end
