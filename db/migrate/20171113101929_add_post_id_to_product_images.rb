class AddPostIdToProductImages < ActiveRecord::Migration[5.1]
  def change
    add_column :product_images, :post_id, :integer
  end
end
