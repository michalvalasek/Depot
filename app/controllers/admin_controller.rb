class AdminController < ApplicationController
  
	def index
		@orders_count = Order.count
	end

end