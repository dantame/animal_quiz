require 'spec_helper'
require 'animal_quiz/property'
require 'animal_quiz/question'
require 'animal_quiz/question_list'
require 'support/animal_properties_context'
require 'support/animal_questions_context'

describe AnimalQuiz::QuestionList do

  include_context 'Animal Properties'
  include_context 'Animal Questions'
  include_context 'Animals'

  let (:questions) { [question1, question3] }
   let (:animals) { [elephant, mouse, mammoth] }

  subject { described_class.new questions }

  it 'has questions' do
    expect(subject.questions).to eq(questions)
  end

  it 'returns the most likely question for the possible animals' do
    expect(subject.get_question(animals)).to eq(question3)
  end

  it 'adds a question' do
    subject.add(question2)
    expect(subject.questions).to include(question1, question2, question3)
  end

  it 'marks questions as used when they are retrieved' do
    subject.get_question(animals)
    expect(subject.used_questions).to include(question3)
  end

  it 'resets questions to the original state with none being used' do
    expect(subject.questions).to include(question3)
    subject.get_question(animals)
    expect(subject.used_questions).to include(question3)
    expect(subject.questions).not_to include(question3)
    subject.reset
    expect(subject.used_questions).to eq([])
    expect(subject.questions).to include(question3)
  end

end
