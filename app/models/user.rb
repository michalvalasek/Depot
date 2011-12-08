# encoding: utf-8

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	validates_presence_of :password, :on => :create

	after_destroy :ensure_a_user_remains
	def ensure_a_user_remains
		if User.count.zero?
			raise "Nemožno odstrániť posledného používateľa."
		end
	end
end
