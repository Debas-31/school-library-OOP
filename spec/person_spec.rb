require_relative '../person'

describe 'Person' do
  before(:each) do
    @person = Person.new('55', 'roshan', parent_permission: true)
  end
  it 'Take age, name and parent_permission' do
    expect(@person.age).to eq '55'
    expect(@person.name).to eq 'roshan'
    expect(@person.parent_permission).to eq true
    expect(@person.rental).to eq []
  end

  it 'The constructor method sets default value for the optional name parameter if it is not provided' do
    person = Person.new(12)
    expect(person.name).to eql 'unknown'
  end

  it 'The constructor method sets default value for the optional parent_permission parameter if it is not provided' do
    person = Person.new(12)
    expect(person.parent_permission).to eql true
  end

  it 'Should return true if the age is less or equal than 18 and the parent_permission in true ' do
    person = Person.new(12, 'Ali', parent_permission: true)
    expect(person.can_use_services?).to eql true
  end

  it 'Should return false if the age is less or equal than 18 and the parent_permission in false ' do
    person = Person.new(12, 'Ali', parent_permission: false)
    expect(person.can_use_services?).to eql false
  end

  it 'Should return true if the age is more or equal than 18 and the parent_permission in false ' do
    person = Person.new(22, 'Ali', parent_permission: false)
    expect(person.can_use_services?).to eql true
  end

  it 'Should return true if the age is more or equal than 18 and the parent_permission in true ' do
    person = Person.new(22, 'Ali', parent_permission: true)
    expect(person.can_use_services?).to eql true
  end

  it 'Should return the name when correct_name is called' do
    person = Person.new(22, 'Ali', parent_permission: true)
    expect(person.correct_name).to eql 'Ali'
  end

  it 'Should return the number of the rental when added rental' do
    person = Person.new(22, 'Ali', parent_permission: true)
    person.add_rental(Book.new('test', 'test'), '2022/09/08')
    person.add_rental(Book.new('test', 'test'), '2022/09/08')
    expect(person.rental.length).to eql 2
  end
end
