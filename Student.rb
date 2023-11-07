require_relative 'Person'

class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    @classroom = classroom
    super(id, age: age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

