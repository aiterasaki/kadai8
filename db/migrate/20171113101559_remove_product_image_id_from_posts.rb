class RemoveProductImageIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :product_image_id, :integer
  end
end
