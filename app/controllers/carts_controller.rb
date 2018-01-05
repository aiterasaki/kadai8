class CartsController < ApplicationController
  # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]


  def show
    @post_carts = current_user.cart.post_carts

  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    @post_cart = PostCart.new(post_cart_params)
    post = Post.find(params[:post_cart][:post_id])
    @post_cart.post_id = post.id
    @post_cart.cart_id = current_user.cart.id
    @post_cart.quantity += params[:post_cart][:quantity].to_i
    @post_cart.total_fee += post.price
    @post_cart.save
    # binding.pry
    #redirect_to controller: 'orders', action: 'create', method: :post, post_id: post.id
    redirect_to cart_path(current_user.cart)

  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @post_cart.update(quantity: params[:quantity].to_i)
    # redirect_to post_path
    redirect_to order_path(current_user.id)
  end

# カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @post_cart.destroy
    redirect_to order_path(current_user.id)
  end

  private

  def post_cart_params
    params.require(:post_cart).permit(:post_id,:cart_id,:quantity,:total_fee)
  end



end