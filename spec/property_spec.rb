require 'spec_helper'
require 'animal_quiz/property'

describe AnimalQuiz::Property do

  let (:property) { 'small' }

  subject { described_class.new property }

  it 'has a property' do
    expect(subject.property).to eq(property)
  end

end
