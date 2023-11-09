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
        if @books.length == 0
            puts 'Currently, there are no books!'
        else
            @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
        end
    end

    def run
        screen
    end
end