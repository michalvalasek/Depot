# encoding: utf-8

require 'test_helper'

class NotifierTest < ActionMailer::TestCase

	setup do
    @order = orders(:one)
  end

  test "order_received" do
    mail = Notifier.order_received(@order)
    assert_equal "Potvrdenie objednávky z Pragmatickej knižnice", mail.subject
    assert_equal @order.email, mail.to[0]
    assert_equal ["test@michalvalasek.com"], mail.from
    assert_match /1 x Začínáme programovat v Ruby on Rails/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(@order)
    assert_equal "Expedovaná objednávka z Pragmatickej knižnice", mail.subject
    assert_equal @order.email, mail.to[0]
    assert_equal ["test@michalvalasek.com"], mail.from
    assert_match /Notifier#order_shipped/, mail.body.encoded
  end

end
