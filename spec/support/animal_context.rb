require 'animal_quiz/animal'
require 'support/animal_properties_context'

shared_context 'Animals' do
    include_context 'Animal Properties'
    let (:elephant) { AnimalQuiz::Animal.new 'Elephant', [big, grey] }
    let (:mouse) { AnimalQuiz::Animal.new 'Mouse', [small, grey, hairy] }
    let (:mammoth) { AnimalQuiz::Animal.new 'Mammoth', [big, grey, hairy] }
end
