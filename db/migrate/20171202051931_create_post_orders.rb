class CreatePostOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :post_orders do |t|
      t.integer :post_id
      t.integer :order_id

      t.timestamps
    end
  end
end
