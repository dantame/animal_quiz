require_relative "animal_quiz/version"
require_relative 'animal_quiz/main'
require_relative 'animal_quiz/console'

module AnimalQuiz
  # Your code goes here...
  game = Main.new Console.new
  game.start
end
