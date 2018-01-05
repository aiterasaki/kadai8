class Cart < ApplicationRecord
	belongs_to :user
	has_many :post_carts, dependent: :destroy
	# validates :quantity, presence: true
	
end
