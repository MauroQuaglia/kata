require 'test-unit'
require 'date'
require_relative 'time_support'
require_relative '../ticket_shop'

class OneWayTicketTest < Test::Unit::TestCase
 include TimeSupport

  def setup
    @ticket = TicketShop.new.get('ONEWAY')
    @now = DateTime.now
  end

  def test_scan_now
    assert_equal ok, @ticket.scan_at(@now)
  end

  def test_scan_when_still_valid
    assert_equal ok, @ticket.scan_at(@now)
    assert_equal ok, @ticket.scan_at(@now + minutes(71))
  end

  def test_scan_when_expired
    assert_equal ok, @ticket.scan_at(@now)
    assert_equal ko, @ticket.scan_at(@now + minutes(72))
  end

  def test_scan_one_year_later
    assert_equal ok, @ticket.scan_at(@now)
    assert_equal ko, @ticket.scan_at(@now + years(1))
  end

  def ok
    'BEEP OK'
  end

  def ko
    'BEEP KO'
  end

end