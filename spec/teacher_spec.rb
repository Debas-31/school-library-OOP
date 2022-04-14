require './teacher'
require './person'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'should return true when we call the can_use_services? method' do
      teacher = Teacher.new('specialization', 33, 'Tony')
      response = teacher.can_use_services?
      expect(response).to eq true
    end

    it 'should create an instance of Person when creating a Teacher' do
      teacher = Teacher.new('specialization', 33, 'Tony')
      expect(teacher).to be_a Person
    end
  end
end
