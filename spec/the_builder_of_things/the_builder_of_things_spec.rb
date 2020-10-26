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

  it 'should be a parent of joe' do
    jane.is_the.parent_of.joe
    expect(jane.respond_to?(:parent_of)).to be_truthy
    expect(jane.parent_of).to eq('joe')
  end

  it 'should have a two legs' do
    jane.has(2).legs
    expect(jane.respond_to?(:legs)).to be_truthy
    expect(jane.legs).is_a?(Array)
    expect(jane.legs.size).to eq(2)
    expect(jane.legs.first).is_a?(Thing)
    expect(jane.legs.last).is_a?(Thing)
  end

  it 'should have one head' do
    jane.has(1).head
    expect(jane.respond_to?(:head)).to be_truthy
    expect(jane.head).is_a?(Thing)
  end

  it 'should define number' do
    # jane.has(2).arms.each { having(1).hand.having(5).fingers }
    jane.has(1).head.each {puts 'ciao'}
    jane.head
    #expect(jane.respond_to?(:head)).to be_truthy
    #expect(jane.head).is_a?(Thing)
  end


end
