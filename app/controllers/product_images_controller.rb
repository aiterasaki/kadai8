class ProductImagesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@product_image = ProductImage.new(product_image_params)
		@product_image.post_id = @post.id
		if @product_image.save
			redirect_to post_path(@post.id)
		else
			render 'new'
			#render root_path
	end
end

private
  def product_image_params
    params.require(:product_image).permit(
      :image
      )
 
  end



end
