# encoding: utf-8

class Order < ActiveRecord::Base

	PAYMENT_TYPES = ["Prevod", "Platobná karta", "Dobierka"]

	has_many :line_items, :dependent => :destroy

	validates :name, :address, :email, :presence => true
	validates :pay_type, :inclusion => PAYMENT_TYPES

	def add_line_items_from_cart(cart)
		cart.line_items.each do |li|
			li.cart_id = nil
			line_items << li
		end
	end

end
