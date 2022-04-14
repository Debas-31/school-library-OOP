require './decorator'
require './person'

describe Decorator do
  it 'should return the first charactere of the name in UpperCase' do
    person = Person.new(22, 'maximilianus')
    person.correct_name
    capitalized_person = CapitalizeDecorator.new(person)

    expect(capitalized_person.correct_name).to eq 'Maximilianus'
  end

  it 'should return only the 10 characheres of the name' do
    person = Person.new(22, 'maximilianus')
    capitalized_trimmed_person = TrimmerDecorator.new(person)
    expect(capitalized_trimmed_person.correct_name).to eq 'maximilian'
  end
end
