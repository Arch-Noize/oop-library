require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

