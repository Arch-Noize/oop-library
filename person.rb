require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # Getters & Setters - changed by rubocop
  attr_reader :id

  attr_accessor :age, :name, :rentals

  # Methods

  def correct_name
    @name
  end

  def can_use_services?
    return true if @parent_permission || of_age?

    false
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
    @rentals.push(rentals)
    rentals
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

person = Person.new(age: 22, name: 'maximilianus')
person.correct_name
capitalized = CapitalizeDecorator.new(person)
puts capitalized.correct_name
trimmed = TrimmerDecorator.new(capitalized)
puts trimmed.correct_name
