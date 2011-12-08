class SessionsController < ApplicationController

	skip_before_filter :authorize

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to admin_url, notice: "Logged in!"
		else
			redirect_to login_url, alert: "Invalid email or password."
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to store_url, notice: "Logged out!"
	end

end
