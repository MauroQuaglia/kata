require_relative '../spec_helper'
require_relative '../../kata/the_builder_of_things_WIP/thing'

describe Thing do
  let(:jane) {described_class.new('Jane')}

  it 'should has a name' do
    expect(jane.name).to eq('Jane')
  end

  it 'should be a person' do
    jane.is_a.person
    expect(jane.person?).to be_truthy
  end

  it 'should not be a man' do
    jane.is_not_a.man
    expect(jane.man?).to be_falsey
  end

  it 'should be a parent of joe' do
    jane.is_the.parent_of.joe
    expect(jane.parent_of).to eq('joe')
  end

  it 'should have a two legs' do
    jane.has(2).legs
    expect(jane.legs).is_a?(Array)
    expect(jane.legs.size).to eq(2)
    expect(jane.legs.first).is_a?(Thing)
    expect(jane.legs.last).is_a?(Thing)
  end

  it 'should have one head' do
    jane.has(1).head
    expect(jane.head).is_a?(Thing)
  end

  it 'should define number' do
    jane.has(2).arms.each {having(1).hand}

    left_arm = jane.arms.first
    expect(left_arm).is_a?(Thing)
    expect(left_arm.name).to eq(:arms)
    expect(left_arm.hand).is_a?(Thing)

    right_arm = jane.arms.first
    expect(right_arm).is_a?(Thing)
    expect(right_arm.name).to eq(:arms)
    expect(right_arm.hand).is_a?(Thing)
  end


  def having(_)
    double.as_null_object
  end

end
