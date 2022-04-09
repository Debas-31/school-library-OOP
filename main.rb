require 'pry'
require './app'

def main
  app = App.new
  app.start_console
end

def list_of_options
  puts 'Enter a number from the list of options: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end
binding.pry
def option(input)
  case 
  when '1'
    list_all_books
  when '2'
    list_all_persons
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_all_rentals
  else
    puts 'please enter a number between 1 and 7'
  end
end
