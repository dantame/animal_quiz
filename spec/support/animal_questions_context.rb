require 'support/animal_properties_context'

shared_context 'Animal Questions' do
  include_context 'Animal Properties'
  let (:question1) { AnimalQuiz::Question.new('Is it small?', [small])}
  let (:question2) { AnimalQuiz::Question.new('Is it big?', [big])}
  let (:question3) { AnimalQuiz::Question.new('Is it grey?', [grey])}
end
