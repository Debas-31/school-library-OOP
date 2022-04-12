class CreateRental
  def inputs_book(books)
    puts 'Select which book you want to rent by entering its number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    gets.chomp.to_i
  end

  def inputs_person(persons)
    puts 'Select a person from the list by its number'
    persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def inputs(books, persons)
    book_id = inputs_book(books)
    person_id = inputs_person(persons)
    print 'Date: '
    date = gets.chomp.to_s
    [book_id, person_id, date]
  end

  def create_rental(books, persons)
    book_id, person_id, date = inputs(books, persons)
    rental = Rental.new(date, persons[person_id], books[book_id])
    puts 'Rental created successfully'
    rental
  end
end
