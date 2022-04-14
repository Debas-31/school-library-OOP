require './teacher'
require './person'

describe Rental do
  context 'When testing the Rental class' do
    it 'The add_rental method returns a rental and adds its to the book' do
      book = Book.new('Title', 'Author')
      person = Person.new(24, 'Bob')

      rental = person.add_rental(book, '2021-05-04')

      expect(person.rental).to eql [rental]
    end

    it 'should return only one rental when adding a rental to a student and a book' do
      person = Student.new(15, 'Harry', parent_permission: true)
      book = Book.new('title', 'author')
      Rental.new('2002/02/02', person, book)

      expect(person.rental.length).to eq 1
      expect(book.rental.length).to eq 1
    end
  end
end
