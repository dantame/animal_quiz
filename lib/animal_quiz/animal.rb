require_relative 'property_utilities'

module AnimalQuiz
  class Animal

    include PropertyUtilities

    attr_reader :name, :properties

    def initialize(name, props = [])
      @name = name
      @properties = props
    end

  end
end
