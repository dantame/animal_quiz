require 'spec_helper'
require 'animal_quiz/console'

describe AnimalQuiz::Console do

  subject { described_class }

  it 'outputs a message to stdout' do
    msg = 'test message'
    expect { subject.write(msg) }.to output("#{msg}\n").to_stdout
  end

end
