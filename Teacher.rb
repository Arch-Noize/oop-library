require_relative 'Person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    @specialization = specialization
    super(id, name: name, age: age, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

