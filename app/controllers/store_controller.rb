class StoreController < ApplicationController
  
  def index
    @products = Product.all
    
    if session[:access_counter].nil?
      session[:access_counter] = 0
    end
    session[:access_counter] += 1
  end

end
