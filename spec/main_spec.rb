require 'spec_helper'
require 'animal_quiz/main'
require 'animal_quiz/console'

describe AnimalQuiz::Main do

    subject do
      described_class.new AnimalQuiz::Console.new
    end

    context 'it is an elephant' do
        it 'asks the question "Is it an Elephant?" and doesn\'t play again' do
          expect(subject.console).to receive(:read).and_return('y', 'n')

          expect(subject.console).to receive(:write).with(
            'Is it an Elephant?',
          )

          expect(subject.console).to receive(:write).with(
            'I guessed your animal! It\'s a Elephant!'
          )

          expect(subject.console).to receive(:write).with(
             'Would you like to play again?'
          )

          subject.start
        end

        it 'adds a monkey to the database' do
          expect(subject.console).to receive(:read).and_return('n', 'monkey', 'tail', 'does it have a tail?', 'n')

          expect(subject.console).to receive(:write).with('Is it an Elephant?')

          expect(subject.console).to receive(:write).with(
            'Looks like I couldn\'t find the animal you were thinking of, what was it?'
          )

          expect(subject.console).to receive(:write).with(
            'Could you tell me some properties of this animal? e.g tall, long, flying',
          )

          expect(subject.console).to receive(:write).with(
            'What question would you ask someone who was thinking of this animal?'
          )

          expect(subject.console).to receive(:write).with('Would you like to play again?')

          subject.start
        end
    end

end
