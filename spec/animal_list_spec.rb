require 'spec_helper'
require 'animal_quiz/property'
require 'animal_quiz/question'
require 'animal_quiz/animal_list'
require 'support/animal_properties_context'
require 'support/animal_questions_context'
require 'support/animal_context'

describe AnimalQuiz::AnimalList do

  include_context 'Animal Properties'
  include_context 'Animals'

  let (:animals) { [elephant, mouse] }

  subject { described_class.new animals }

  it 'has animals' do
    expect(subject.animals).to eq(animals)
  end

  it 'returns a list of animals that satisfy a combination of confirmed and rejected properties' do
    confirmed_props = [big, grey]
    rejected_props = [small]
    expect(subject.get_animals(confirmed_props, rejected_props)).to eq([elephant])

    confirmed_props = []
    expect(subject.get_animals(confirmed_props, rejected_props)).to eq([elephant])
  end

  it 'adds an animal to the list' do
    subject.add(mammoth)
    expect(subject.animals).to include(elephant, mouse, mammoth)
  end

end
