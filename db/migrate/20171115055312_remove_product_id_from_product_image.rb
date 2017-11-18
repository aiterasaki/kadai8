class RemoveProductIdFromProductImage < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_images, :product_id, :integer
  end
end
