class Rental
  attr_accessor :date, :books, :person

  def initialize(date, books, person)
    @date = date
    @books = books
    @person = person

    person.rentals << self
    books.rentals << self
  end
end
