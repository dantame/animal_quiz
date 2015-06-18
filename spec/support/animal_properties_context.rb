shared_context 'Animal Properties' do
  let (:small) { AnimalQuiz::Property.new('small') }

  let (:grey) { AnimalQuiz::Property.new('grey') }

  let (:hairy) { AnimalQuiz::Property.new('hairy') }

  let (:big) { AnimalQuiz::Property.new('big') }

  let (:properties) { [small, grey] }
end
