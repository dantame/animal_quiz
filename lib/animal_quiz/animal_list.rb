module AnimalQuiz
  class AnimalList

    attr_reader :animals

    def initialize animals
      @animals = animals
    end

    def get_animals confirmed_props, rejected_props
      return @animals if confirmed_props.length == 0 && rejected_props.length == 0

      animals = @animals.select do |a|
        a.has_all_properties? *confirmed_props
      end

      animals = animals.reject do |a|
        a.has_any_properties? *rejected_props
      end

      animals.flatten.uniq
    end

    def add animal
      @animals.push animal
    end

  end
end
