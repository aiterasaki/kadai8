class ProductImage < ApplicationRecord

	belongs_to :post
	
	# , optional: true
	#mount_uploader :image_id, ImageUploader

	#大きい画像

	mount_uploader :image_id, PictureUploader
	accepts_nested_attributes_for :post

	mount_uploader :image, ImageUploader
end
