module CartsHelper
	def current_cart
		#@current_cart ||= CurrentCart.set_cart
		@current_cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end
end
