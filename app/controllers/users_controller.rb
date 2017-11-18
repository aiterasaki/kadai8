class UsersController < ApplicationController
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
