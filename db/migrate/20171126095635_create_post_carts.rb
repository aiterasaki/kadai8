class CreatePostCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :post_carts do |t|
      t.integer :post_id
      t.integer :cart_id
      t.integer :quantity, default: 0
      t.integer :total_fee,default: 0

      t.timestamps
    end
  end
end
