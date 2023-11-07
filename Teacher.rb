require_relative 'Person'

class Teacher < Person

    def initialize(age, name = "Unknown", parent_permission = true, specialization)
        @specialization = specialization
        super(age, name, parent_permission)
    end

    def can_use_services?
        true
    end
end

teacher = Teacher.new(50, 'Mylene', true, 'Grammar')

puts teacher.can_use_services?