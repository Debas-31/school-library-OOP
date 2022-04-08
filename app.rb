require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank you for using my School Library!'
        break
      end

      option input
    end
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @book.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name} Age: #{person.age} Id: #{person.id}" }
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 :'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student 
    puts 'Creaate a new student'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter student age'
    age = gets.chomp.to_i
    print 'Has parent permission? [y/n]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      Student.new(age, 'classroom', name, parent_permission: false)
      @persons << student
      puts "Student doesn't have parent permission, can't rent a books "
    when 'y'
      student = Student.new(age, 'classroom', name, parent_permission: true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter teacher age'
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @person << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    Print 'Enter an author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |_book, index| puts "[#{index}] Title: #{books.title} Author: #{books.author}" }

    book_id = gets.chomp.to_i

    Puts 'Select a person from the list by its number'
    @person.each_with_index do |person, index|
      puts "[#{index}] [#{person.class.name}] Name: #{person.name} Id: #{person.id} Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "person: #{rental.person.name} Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'No records where found for the given ID'
      end
    end
  end
end
