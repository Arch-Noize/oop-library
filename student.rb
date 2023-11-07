require_relative 'person'

class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age: age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student = Student.new(age: 26, name: 'Paula', parent_permission: false, classroom: 'Grammar')

puts student.name
