require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './lib/create_books'
require './lib/create_persons'
require './lib/create_rental'
require './lib/displayer'
require './lib/load_data'

class App
  attr_accessor :books, :rentals, :persons

  def initialize
    initialize_files
    @books = load_books
    @persons = load_persons
    @rentals = load_rentals(@persons, @books)
    @displayer = Displayer.new
  end

  def list_all_books
    @displayer.display_books(@books)
  end

  def list_all_persons
    @displayer.display_persons(@persons)
  end

  def create_person
    @persons << CreatePerson.new.create_person
  end

  def create_book()
    @books << CreateBook.new.create_book
  end

  def create_rental
    @rentals << CreateRental.new.create_rental(@books, @persons)
  end

  def list_all_rentals
    @displayer.display_rentals(@persons, @rentals)
  end
end
