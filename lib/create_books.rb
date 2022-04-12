class CreateBook
  def inputs
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    [title, author]
  end

  def create_book()
    puts 'Create a new book'
    title, author = inputs
    puts "Book #{title} created successfully."
    Book.new(title, author)
  end
end
