class PostOrder < ApplicationRecord
	belongs_to :order
	belongs_to :post
end
