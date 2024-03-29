class StoreController < ApplicationController

	skip_before_filter :authorize

  def index
    @products = Product.all
    @cart = current_cart
    
    if session[:access_counter].nil?
      session[:access_counter] = 0
    end
    session[:access_counter] += 1
  end

end
