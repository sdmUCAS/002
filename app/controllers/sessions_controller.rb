class SessionsController < ApplicationController
	def new
		
	end
	
	def create
  		user = User.find_by username: params[:session][:username],password: params[:session][:password]
  		if user
    		sign_in user
    		redirect_to(:action =>"index", :controller =>"welcome")
  		else
    		flash[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
  		end
	end


	
	def destroy
    	sign_out
    	session[:cart_id]=nil
    	redirect_to(:action =>"index", :controller =>"welcome")
  	end
  	
  	def add_to_cart
  		@cart = find_cart
  		instrument = Instrument.find(params[:id])
  		@cart.add_instrument(instrument)
  	end
  	

  	def find_cart
  		#session = Session.find(cookies[:session_id])
  		cookies[:cart] ||= Cart.new  #如果不存在，就新建一个并返回，如果已存在就返回当前的
  		#unless session[:cart] # if there's no cart in the session
 		#	session[:cart] = Cart.new # add a new one
 		#end
 		#session[:cart] # return existing or new cart
  	end

end
