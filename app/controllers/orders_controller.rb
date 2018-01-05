class OrdersController < ApplicationController

	# def create
	# 	@post = Post.new(params[:post_id])
		
		
	# end

	def show
		@post_carts = current_user.cart.post_carts
		@order = Order.new
		@order.user_id = current_user.id
	 	
	end

	def create
		@order = Order.new
		@order.user_id = current_user.id
		@order.save
		# ログインしてる人に紐づいたオーダーの情報を新規作成
		@post_carts = current_user.cart.post_carts
		# ログインしてる人のカートの中に入ってる商品の情報を取得
		@post_carts.each do |post_cart|
			# post_cartsには複数の商品の情報が入っているので、eachで一つ一つにバラす
			@post_order = PostOrder.new
			# 一つ一つのpost_cartに対して、post_orderを新規作成
			@post_order.order_id = @order.id
			# order_idは一つの注文に対し一つなので、@order.idを毎回代入
			@post_order.post_id = post_cart.post_id
			# post_idはeachで回したそれぞれを代入
			@post_order.save
			post_cart.delete
			# 注文画面に行ったらcartの中身は無くなるべきなので、delete
		end
		redirect_to root_path
	end



	def edit
		
	end
	
	def update
		@post = Post.find(params[:post_id])
		if @post.update_attributes(params[:post_id])
		redirect_to posts_path
		else
		render action: 'show'
		end

	end
end
