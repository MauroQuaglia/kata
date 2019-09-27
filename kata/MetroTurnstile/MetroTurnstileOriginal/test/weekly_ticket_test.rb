require 'test-unit'
require 'date'
require_relative 'time_support'
require_relative '../weekly_ticket'

class WeeklyTicketTest < Test::Unit::TestCase
  include TimeSupport

  def setup
    @ticket = WeeklyTicket.new
    @monday = DateTime.new(2014, 10, 20)
    assert_true @monday.monday?
  end

  def test_scan_in_a_day
    assert_equal ok, @ticket.scan_at(@monday)
  end

  def test_scan_in_the_same_week
    saturday = @monday + days(5)
    sunday = @monday + days(6)

    assert_equal ok, @ticket.scan_at(@monday)
    assert_equal ok, @ticket.scan_at(saturday)
    assert_equal ok, @ticket.scan_at(sunday)
  end

  def test_scan_in_the_different_week
    next_monday = @monday + days(7)

    assert_equal ok, @ticket.scan_at(@monday)
    assert_equal ko, @ticket.scan_at(next_monday)
  end

  def test_scan_in_the_same_week_of_next_year
    first_week_2000 = DateTime.new(2000, 1, 5)
    first_week_2001 = DateTime.new(2001, 1, 5)
    assert_equal first_week_2000.cweek, first_week_2001.cweek

    assert_equal ok, @ticket.scan_at(first_week_2000)
    assert_equal ko, @ticket.scan_at(first_week_2001)
  end

  def ok
    "DISPLAY WEEKLY\nBEEP WEEKLY OK"
  end

  def ko
    "DISPLAY WEEKLY\nBEEP WEEKLY KO"
  end

end