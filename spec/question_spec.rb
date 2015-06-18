require 'spec_helper'
require 'animal_quiz/question'
require 'animal_quiz/property'
require 'support/animal_properties_context'
require 'support/it_has_properties'

describe AnimalQuiz::Question do

  include_context 'Animal Properties'

  let (:question) { 'Is it a mouse?' }

  subject { described_class.new question, properties }

  it 'has a question' do
    expect(subject.question).to eq(question)
  end

  it_behaves_like 'it has properties'

end
