require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    @specialization = specialization
    super(name: name, age: age, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(age: 50, name: 'Mylene', parent_permission: false, specialization: 'Grammar')

puts teacher.name
