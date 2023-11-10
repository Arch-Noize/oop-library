require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    if @books.empty?
      puts 'Currently, there are no books!'
    else
      @books.each_with_index do |book, i|
        puts "#{i}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'Currently, there are no people in this library / school!'
    else
      @people.each_with_index do |person, i|
        puts "#{i}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      puts 'Age: '
      age = gets.chomp.to_i

      puts 'Name: '
      name = gets.chomp.to_s

      puts 'Has parent permission? [Y / N]: '
      parent_permission = gets.chomp.to_s

      puts 'Class:'
      classroom = gets.chomp.to_s

      if parent_permission =~ /^[Yy]/
        @people.push(Student.new(classroom, age, name, parent_permission: true))
      elsif parent_permission =~ /^[Nn]/
        @people.push(Student.new(classroom, age, name, parent_permission: false))
      else
        puts "Invalid choice. Please enter a valid option. (#{parent_permission})"
      end

    when 2
      puts 'Age: '
      age = gets.chomp.to_i

      puts 'Name: '
      name = gets.chomp.to_s

      puts 'Specialization: '
      specialization = gets.chomp.to_s

      @people.push(Teacher.new(specialization, age, name))
    else
      puts 'Invalid choice. Please enter a valid option.'
    end

    puts 'Person created successfully'
  end

  def add_book
    puts 'Title:'
    title = gets.chomp.to_s

    puts 'Author:'
    author = gets.chomp.to_s

    @books.push(Book.new(title, author))
  end

  def add_rental
    puts 'Select a book from the following list by number:'
    list_books
    book_idx = gets.chomp.to_i

    if (0...@books.length).include?(book_idx)
      book = @books[book_idx]
    else
      puts "Error adding a record. Book #{book_idx} doesn't exist"
    end

    puts 'Select a person from the following list by number (not id)'
    list_people
    person_idx = gets.chomp.to_i

    if (0...@people.length).include?(person_idx)
      person = @people[person_idx]
    else
      puts "Error adding a record. Person #{person_idx} doesn't exist"
    end

    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(date, book, person))
    puts
  end

  def list_rental
    puts 'ID of person: '
    id = gets.chomp.to_i
    filtered = @rentals.find_all { |rental| rental.person.id == id }
    puts "Person with given id #{id} does not exist" if filtered.empty?

    puts 'Rentals:'
    filtered.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  def run
    screen
  end
end
