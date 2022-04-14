require_relative '../book'
require_relative '../rental'

describe 'Book' do
  before(:each) do
    @book = Book.new('Harry poter', 'jk rouling')
  end
  it 'Take title and author' do
    expect(@book.author).to eq 'jk rouling'
    expect(@book.title).to eq 'Harry poter'
    expect(@book.rental).to eq []
  end

  it 'Take title and author' do
    book2 = Book.new('The Gorkha', 'Roshan')
    expect(book2.author).to eq 'Roshan'
    expect(book2.title).to eq 'The Gorkha'
  end

  it 'Should return the number of the rental when added rentals' do
    book = Book.new('test', 'test')
    book.add_rental(Person.new(22, 'Ali'), '2022/09/08')
    book.add_rental(Person.new(22, 'Ali'), '2022/09/08')
    expect(book.rental.length).to eql 2
  end
end
