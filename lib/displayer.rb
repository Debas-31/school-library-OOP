class Displayer
  def display_books(books)
    puts 'Database is empty! Add a book.' if books.empty?
    books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def display_persons(persons)
    puts 'Database is empty! Add a person.' if persons.empty?
    persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def display_rentals(persons, rentals)
    puts 'To see person rentals enter the person ID: '
    persons.each do |person|
      puts "id: #{person.id}"
    end
    id = gets.chomp.to_i
    puts 'Rented Books:'
    rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end
