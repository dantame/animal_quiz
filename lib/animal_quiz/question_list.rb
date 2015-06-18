module AnimalQuiz
  class QuestionList

    attr_reader :questions
    attr_reader :used_questions

    def initialize questions
      @questions = questions
      @used_questions = []
    end

    def get_question animals
      questions = animals.map do |a|
        @questions.compact.select do |q|
            q.has_any_properties? *a.properties
          end
      end

      freq = questions.flatten.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      max = freq.values.max
      hashes = freq.select { |k, f| f == max }
      q = hashes.keys[0]
      @used_questions.push(q)
      @questions.delete(q)
      return q
    end

    def add question
      @questions.push question
    end

    def reset
      @questions.push(*@used_questions)
      @used_questions = []
    end

  end
end
