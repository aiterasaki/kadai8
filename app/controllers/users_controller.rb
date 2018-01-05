class UsersController < ApplicationController
  

   def new
    @cart = Cart.new
    @cart.user_id = current_user.id
    @cart.save
    redirect_to posts_path 
  end

  def index
  	#@user = User.all
  end

  def show
  	#current
  	@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
    posts_attributes: [
    	:title,
    	:body,
    	:picture,
    	:price]
      )

  end
end
