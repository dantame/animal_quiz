require_relative 'property_utilities'

module AnimalQuiz
  class Question

    include PropertyUtilities

    attr_reader :question, :properties

    def initialize(question, props = [])
      @question = question
      @properties = props
    end

  end
end
