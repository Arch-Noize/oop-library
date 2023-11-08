require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age: age, name: name, parent_permission: parent_permission)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student = Student.new(age: 26, name: 'Paula', parent_permission: false, classroom: 'Grammar')

puts student.name
