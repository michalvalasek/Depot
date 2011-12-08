# encoding: utf-8

class ApplicationController < ActionController::Base
  
  before_filter :authorize
	protect_from_forgery
  
  private
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

		def current_user
			@current_user ||= User.find(session[:user_id]) if session(:user_id)
		end
		helper_method :current_user

		def authorize
			unless User.find_by_id(session[:user_id]) || session[:user_id] = 0
				redirect_to login_url, notice: "Prihláste sa prosím."
			end
		end
  
end
