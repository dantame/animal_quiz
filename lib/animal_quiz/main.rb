require_relative 'property'
require_relative 'question'
require_relative 'animal'
require_relative 'animal_list'
require_relative 'question_list'

module AnimalQuiz
  class Main

    def initialize
      @confirmed_props = []
      @rejected_props = []

      elephant_properties = [ AnimalQuiz::Property.new('grey'),
                              AnimalQuiz::Property.new('big'),
                              AnimalQuiz::Property.new('tusks'),
                              AnimalQuiz::Property.new('big ears')
                            ]

      @questions = AnimalQuiz::QuestionList.new []

      elephant = AnimalQuiz::Animal.new 'Elephant', elephant_properties

      @animals = AnimalQuiz::AnimalList.new [elephant]
    end

    def start
      update
    end

    private
    def update
      @possible_animals = @animals.get_animals @confirmed_props, @rejected_props
      ask_question get_next_question(@possible_animals) unless @possible_animals.length < 1
    end

    private
    def get_next_question possible_animals
      q = @questions.get_question(possible_animals)
      return AnimalQuiz::Question.new("Is it an #{possible_animals[0].name}?", possible_animals[0].properties) unless possible_animals.length >= 1 && q
      q
    end

    private
    def ask_question q
      puts q.question
      answer = gets.chomp

      return win_game if answer == 'y' && @possible_animals.length == 1
      return poll_user_for_information if answer == 'n' && @possible_animals.length <= 1

      confirm_props q.properties if answer == 'y'
      reject_props q.properties if answer == 'n'

      update
    end

    private
    def confirm_props properties
      properties.each do |p|
        @confirmed_props.push(p) unless @rejected_props.include?(p)
      end
    end

    private
    def reject_props properties
      properties.each do |p|
        @rejected_props.push(p) unless @confirmed_props.include?(p)
      end
    end

    private
    def win_game
      puts "I guessed your animal! It's a #{@possible_animals[0].name}!"
      restart
    end

    private
    def poll_user_for_information
      puts "Looks like I couldn't find the animal you were thinking of, what was it?"
      animal_name = gets.chomp
      puts 'Could you tell me some properties of this animal? e.g tall, long, flying'
      properties_list = gets.chomp.split(',')
      puts 'What question would you ask someone who was thinking of this animal?'
      question_text = gets.chomp

      add_to_database animal_name, properties_list, question_text

      restart
    end

    private
    def add_to_database animal_name, properties_list, question_text
      properties = properties_list.map do |p|
        AnimalQuiz::Property.new p
      end

      animal = AnimalQuiz::Animal.new animal_name, properties
      question = AnimalQuiz::Question.new question_text, properties

      @questions.add(question)
      @animals.add(animal)
    end

    def restart
      puts 'Would you like to play again?'
      play_again = gets.chomp

      reset if play_again == 'y'
    end

    def reset
      @confirmed_props = []
      @rejected_props = []
      @questions.reset
      start
    end

  end
end
