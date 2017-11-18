class Post < ApplicationRecord

	belongs_to :user
	has_many :product_images, dependent: :destroy
	#サムネ用
	mount_uploader :picture, ImageUploader
	accepts_nested_attributes_for :product_images
	
	#大きい画像
	#mount_uploader :image_id, PictureUploader
	#attr_accessible :image_id,:post_id
	
	validates :title, presence: true
	validates :body, presence: true
	validates :price, presence: true


	#attachment :product_image
    #Svalidates_presence_of :product_image
end
