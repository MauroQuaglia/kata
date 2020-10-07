require_relative '../spec_helper'
require_relative '../../kata/the_builder_of_things/thing'

describe 'Thing' do
  let(:jane) {Thing.new('Jane')}

  it 'should has a name' do
    expect(jane.name).to eq('Jane')
  end

  it 'should be a person' do
    jane.is_a.person
    expect(jane.person?).to be_truthy
  end


end