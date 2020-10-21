require_relative '../spec_helper'
require_relative '../../kata/the_builder_of_things/thing'

describe Thing do
  let(:jane) {described_class.new('Jane')}

  it 'should has a name' do
    expect(jane.name).to eq('Jane')
  end

  it 'should be a person' do
    jane.is_a.person
    expect(jane.respond_to?(:person?)).to be_truthy
    expect(jane.person?).to be_truthy
  end

  it 'should not be a man' do
    jane.is_not_a.man
    expect(jane.respond_to?(:man?)).to be_truthy
    expect(jane.man?).to be_falsey
  end

end