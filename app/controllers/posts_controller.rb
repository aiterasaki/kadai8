class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  

  #add_breadcrumb 'ホーム', :root_path
  add_breadcrumb '商品一覧', :posts_path

  def new
    @post = Post.new
    # 3.times {
    #   @post.product_images.build(post_id: @post.id)
    # }
    # @post.product_images.build
    #@product_image = ProductImage.new
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
    # @product_image = ProductImage.new(product_image_params)
    # @product = ProductImage.new

    # 第二引数を省くとリンクではない階層を作れる
    add_breadcrumb '商品詳細' #@post.user_id, :post_path(posts_id: )
    #(post_id: @post.id)
    add_breadcrumb @post_title, :post_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	# @post.title = params[:title]
  	# @post.body = params[:body]
  	@post.update(post_params)

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
      product_images_attributes: [:post_id,:image_id]
      )
    # permitに書いたカラムが足らなくてもダメだし、余分でもだめ
  end

  # def product_image_params
  #   params.require(:product_image).permit(:post_id,:image_id)
  # end

  def correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user.id

      redirect_to root_path      
    end
  end
end
