class RemoveTagFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :product_image, :string
  end
end
