require 'spec_helper'
require 'animal_quiz/console'

describe AnimalQuiz::Console do

  subject { described_class.new }

  it 'outputs a message to stdout' do
    msg = 'test message'
    expect { subject.write(msg) }.to output("#{msg}\n").to_stdout
  end

  it 'receives a msg from stdin' do
    msg = 'test'

    allow(STDIN).to receive(:gets).and_return(msg)

    expect(subject.read).to eq(msg)
  end

end
