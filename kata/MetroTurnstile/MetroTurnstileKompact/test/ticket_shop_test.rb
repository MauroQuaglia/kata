require 'test-unit'
require 'date'
require_relative '../ticket_shop'

class TicketShopTest < Test::Unit::TestCase

  def test_get_one_way_ticket
    ticket = TicketShop.new.get('ONEWAY')

    assert_true ticket.scan_at(DateTime.now).include?('BEEP OK')
  end

  def test_get_daily_ticket
    ticket = TicketShop.new.get('DAILY')

    assert_true ticket.scan_at(DateTime.now).include?('BEEP DAILY OK')
  end

  def test_get_weekly_ticket
    ticket = TicketShop.new.get('WEEKLY')

    assert_true ticket.scan_at(DateTime.now).include?('BEEP WEEKLY OK')
  end

end