class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  add_breadcrumb '商品一覧', :posts_path

  def new
    @post = Post.new
    @post.product_images.build
 
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
    	redirect_to @post
      # redirect_to current_user
    else
      render 'new'
    end
  end

  def index
  	@posts = Post.all.order(created_at: 'desc').page(params[:page])
  end
  
  def show
  	@post = Post.find(params[:id])
    @post_cart = @post.post_carts.build
    @numbers = [1..100]

    # 第二引数を省くとリンクではない階層を作れる
    add_breadcrumb '商品詳細' 
    add_breadcrumb @post_title, :post_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(post_params_up)

  	redirect_to post_path(@post.id)
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy

  	redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :user_id,
      :price,
      :picture,
      product_images_attributes: [:post_id, :image_id]
    )
    # permitに書いたカラムが足らなくてもダメだし、余分でもだめ
  end


  def post_params_up
    params.require(:post).permit(
      :title,
      :body,
      :user_id,
      :price,
      :picture
    )
    # permitに書いたカラムが足らなくてもダメだし、余分でもだめ
  end

  def correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user.id

      redirect_to root_path      
    end
  end
end
