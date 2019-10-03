require_relative '../spec_helper'
require_relative '../../kata/underground/daily_ticket'
require_relative '../../spec/underground/time_support'
require 'date'

describe DailyTicket do
  include TimeSupport

  subject {described_class.new}

  it 'should be valid at first scan' do
    expect(subject.scan_at(DateTime.now)).to eq(ok)
  end

  it 'should be valid in the same day' do
    morning = DateTime.new(2015, 12, 25, 10)
    afternoon = morning + hours(5)

    expect(subject.scan_at(morning)).to eq(ok)
    expect(subject.scan_at(afternoon)).to eq(ok)
  end

  it 'should not be valid after midnight' do
    today = DateTime.new(2015, 12, 25, 23, 59, 30)
    tomorrow = today + minutes(1)

    expect(subject.scan_at(today)).to eq(ok)
    expect(subject.scan_at(tomorrow)).to eq(ko)
  end

  private

  def ok
    "DISPLAY DAILY\nBEEP DAILY OK"
  end

  def ko
    "DISPLAY DAILY\nBEEP DAILY KO"
  end

end