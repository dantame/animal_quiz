module AnimalQuiz
  class Property

    attr_reader :property

    def initialize(property)
      @property = property
    end

    def ==(other_obj)
      other_obj.property == @property
    end

  end
end
