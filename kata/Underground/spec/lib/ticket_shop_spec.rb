require_relative '../../lib/d/lib/ticket_shop'

RSpec.describe TicketShop do

  it 'should sell a one way ticket' do
    expect(
        described_class.buy(:ONEWAY)
    ).to be_instance_of(OneWayTicket)
  end

  it 'should sell a daily ticket' do
    expect(
        described_class.buy(:DAILY)
    ).to be_instance_of(DailyTicket)
  end

  it 'should sell a weekly ticket' do
    expect(
        described_class.buy(:WEEKLY)
    ).to be_instance_of(WeeklyTicket)
  end

end