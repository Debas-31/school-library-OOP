require './student'
require './teacher'
require './rental'

def save_datas(books, persons, rentals)
  save_books(books)
  save_persons(persons)
  save_rentals(rentals)
end

def save_books(books)
  books_save = []
  books.each do |b|
    books_save << { title: b.title, author: b.author }
  end

  ruby = JSON.generate(books_save)

  File.write('./datas/books.json', ruby.to_s)
end

def save_persons(persons)
  persons_save = []
  persons.each do |p|
    persons_save << if p.instance_of? Student
                      { classe: 'Student', parent_permission: p.parent_permission, age: p.age, name: p.name,
                        classroom: p.classroom }
                    else
                      { classe: 'Teacher', specialization: p.specialization, age: p.age, name: p.name }
                    end
  end

  ruby = JSON.generate(persons_save)

  File.write('./datas/persons.json', ruby.to_s)
end

def save_rentals(rentals)
  data = []
  rentals.each do |rental|
    data.push({ date: rental.date, person_id: rental.person.id, name: rental.person.name, book_id: rental.book.id,
                title: rental.book.title })
  end
  File.write('./datas/rentals.json', JSON.generate(data))
end
