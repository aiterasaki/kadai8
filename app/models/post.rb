class Post < ApplicationRecord

	belongs_to :user
	has_many :product_images, dependent: :destroy
	has_many :post_carts, dependent: :destroy
	has_many :post_orders, dependent: :destroy
	

	#サムネ用
	mount_uploader :picture, ImageUploader
	accepts_nested_attributes_for :product_images
	
	
	validates :title, presence: true
	validates :body, presence: true
	validates :price, presence: true

end
