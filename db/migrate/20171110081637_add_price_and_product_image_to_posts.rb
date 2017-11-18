class AddPriceAndProductImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :price, :integer
    add_column :posts, :product_image, :string
  end
end
