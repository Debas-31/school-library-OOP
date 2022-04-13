require './student'
require './teacher'
require './rental'

def initialize_files
  File.write('./datas/books.json', '[]') unless File.exist?('./datas/books.json')
  File.write('./datas/persons.json', '[]') unless File.exist?('./datas/persons.json')
  File.write('./datas/rentals.json', '[]') unless File.exist?('./datas/rentals.json')
end

def load_books
  books = []
  books_save = JSON.parse(File.read('./datas/books.json'))
  books_save.each do |b|
    books << Book.new(b['title'], b['author'])
  end
  books
end

def load_persons
  persons = []
  persons_save = JSON.parse(File.read('./datas/persons.json'))

  persons_save.each do |p|
    persons << if p['classe'] == 'Student'
                 Student.new(p['age'], p['name'], parent_permission: p['parent_permission'])
               else
                 Teacher.new(p['specialization'], p['age'], p['name'])
               end
  end
  persons
end

def load_rentals(persons, books)
  rentals = []
  rentals_save = JSON.parse(File.read('./datas/rentals.json'))
  rentals_save.each do |r|
    rentals << Rental.new(r['date'],
                          persons.select { |p| p.name == r['name'] } [0],
                          books.select { |b| b.title == r['title'] } [0])
  end
  rentals
end
