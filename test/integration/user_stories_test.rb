# encoding: utf-8

require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

	test "buying a product" do
	  # priprava
		LineItem.delete_all
		Order.delete_all
		ruby_book = products(:ruby)

		# user pride na stranku
	  get '/'
		assert_response :success
		assert_template 'index'

		# user vyberie produkt a prida ho do svojho kosiku
		xml_http_request :post, '/line_items', product_id: ruby_book.id
		assert_response :success

		cart = Cart.find(session[:cart_id])
		assert_equal 1, cart.line_items.size
		assert_equal ruby_book, cart.line_items[0].product

		# user prejde k objednavke
		get '/orders/new'
		assert_response :success
		assert_template 'new'

		# user vyplni udaje do objednavky, odosle ju a je presmerovany na hlavnu stranku s prazdnym kosikom
		post_via_redirect '/orders', order: { name: "David Slonek",
																					address: "Hlavna 1",
																					email: "david@slonek.sk",
																					pay_type: "Dobierka" }
		assert_response :success
		assert_template 'index'
		cart = Cart.find(session[:cart_id])
		assert_equal 0, cart.line_items.size

		# objednavka je vytvorena v databaze
		orders = Order.all
		assert_equal 1, orders.size
		order = orders[0]

		# objednavka obsahuje spravne udaje
		assert_equal "David Slonek", order.name
		assert_equal "Hlavna 1", order.address
		assert_equal "david@slonek.sk", order.email
		assert_equal "Dobierka", order.pay_type
		assert_equal 1, order.line_items.size
		line_item = order.line_items[0]
		assert_equal ruby_book, line_item.product

		# userovi bol odoslany email s potvrdenim objednavky
		mail = ActionMailer::Base.deliveries.last
		assert_equal ["david@slonek.sk"], mail.to
		assert_equal "test@michalvalasek.com", mail[:from].value
		assert_equal "Potvrdenie objednávky z Pragmatickej knižnice", mail.subject
	end

end
