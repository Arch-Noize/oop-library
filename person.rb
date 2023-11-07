require_relative 'nameable'

class Person
  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # Getters - changed by rubocop
  attr_reader :id

  attr_accessor :age, :name

  # Setters

  def can_use_services?
    return true if @parent_permission || of_age?

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

person = Person.new(age: 24, name: 'Santiago', parent_permission: false)

puts person.name
puts person.age
puts person.can_use_services?
