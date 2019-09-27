require 'test-unit'
require 'date'
require_relative 'time_support'
require_relative '../daily_ticket'

class DailyTicketTest < Test::Unit::TestCase
  include TimeSupport

  def setup
    @ticket = DailyTicket.new
  end

  def test_scan_now
    assert_equal ok, @ticket.scan_at(DateTime.now)
  end

  def test_scan_in_the_same_day
    morning = DateTime.new(2014, 12, 25, 10)
    afternoon = morning + hours(5)

    assert_equal ok, @ticket.scan_at(morning)
    assert_equal ok, @ticket.scan_at(afternoon)
  end

  def test_scan_in_different_days
    today = DateTime.new(2014, 12, 25, 23, 59, 30)
    tomorrow = today + minutes(1)

    assert_equal ok, @ticket.scan_at(today)
    assert_equal ko, @ticket.scan_at(tomorrow)
  end

  def ok
    "DISPLAY DAILY\nBEEP DAILY OK"
  end

  def ko
    "DISPLAY DAILY\nBEEP DAILY KO"
  end

end