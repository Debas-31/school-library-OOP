require './rental'

class Book
  attr_reader :id
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
