require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  test "add unique products" do
    cart = Cart.create
    book_one = products(:one)
    book_two = products(:two)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    assert_equal 2, cart.line_items.size
    assert_equal book_one.price + book_two.price, cart.total_price
  end
  
  test "add duplicate product" do
    cart = Cart.create
    book_one = products(:one)
    book_two = products(:one)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    assert_equal 1, cart.line_items.size
    assert_equal 2 * book_one.price, cart.total_price
    assert_equal 2, cart.line_items[0].quantity
  end
  
end
