class PostCart < ApplicationRecord
	belongs_to :cart
    belongs_to :post
	# validates :cart, presence: true
	#validates :user_id, uniqueness: { scope: :post_id }
	# validates :post, presence: true
end
