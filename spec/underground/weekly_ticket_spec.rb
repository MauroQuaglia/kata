require_relative '../spec_helper'
require_relative '../../kata/underground/weekly_ticket'
require_relative '../../spec/underground/time_support'
require 'date'

describe WeeklyTicket do
  include TimeSupport

  subject {described_class.new}

  before do
    @monday = DateTime.new(2014, 10, 20)
  end

  it 'should be monday' do
    expect(@monday.monday?).to be_truthy
  end

  it 'should be valid on monday' do
    expect(subject.scan_at(@monday)).to eq(ok)
  end

  it 'should be valid in the same week' do
    saturday = @monday + days(5)
    sunday = @monday + days(6)

    expect(subject.scan_at(saturday)).to eq(ok)
    expect(subject.scan_at(sunday)).to eq(ok)
  end

  it 'should not be valid in the same week of different year' do
    first_week_2000 = DateTime.new(2000, 1, 5)
    first_week_2001 = DateTime.new(2001, 1, 5)

    expect(first_week_2000.cweek).to eq(first_week_2001.cweek)

    expect(subject.scan_at(first_week_2000)).to eq(ok)
    expect(subject.scan_at(first_week_2001)).to eq(ko)
  end

  private

  def ok
    "DISPLAY WEEKLY\nBEEP WEEKLY OK"
  end

  def ko
    "DISPLAY WEEKLY\nBEEP WEEKLY KO"
  end

end