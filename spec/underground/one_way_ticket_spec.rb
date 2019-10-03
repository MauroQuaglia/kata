require_relative '../spec_helper'
require_relative '../../kata/underground/one_way_ticket'
require_relative '../../spec/underground/time_support'
require 'date'

describe OneWayTicket do
  include TimeSupport

  subject {described_class.new}

  before do
    @time = DateTime.now
  end

  it 'should be valid at first scan' do
    expect(subject.scan_at(@time)).to eq(ok)
  end

  it 'should be valid after 71 minutes' do
    expect(subject.scan_at(@time)).to eq(ok)
    expect(subject.scan_at(@time + minutes(71))).to eq(ok)
  end

  it 'should not be valid after 72 minutes' do
    expect(subject.scan_at(@time)).to eq(ok)
    expect(subject.scan_at(@time + minutes(72))).to eq(ko)
  end

  it 'should not be valid one year later' do
    expect(subject.scan_at(@time)).to eq(ok)
    expect(subject.scan_at(@time + years(1))).to eq(ko)
  end

  private

  def ok
    'BEEP OK'
  end

  def ko
    'BEEP KO'
  end

end