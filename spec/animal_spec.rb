require 'spec_helper'
require 'animal_quiz/animal'
require 'animal_quiz/property'
require 'support/animal_properties_context'
require 'support/it_has_properties'

describe AnimalQuiz::Animal do

  include_context 'Animal Properties'

  let (:name) { 'mouse' }

  subject { described_class.new name, properties }

  it 'has a name' do
    expect(subject.name).to eq(name)
  end

  it_behaves_like 'it has properties'

end
