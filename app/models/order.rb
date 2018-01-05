class Order < ApplicationRecord
	has_many :post_orders, dependent: :destroy
	belongs_to :user

end
