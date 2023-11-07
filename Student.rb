require_relative 'Person'

class Student < Person

    def initialize(age, name = "Unknown", parent_permission = true, classroom)
        @classroom = classroom
        super(age, name, parent_permission)
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end

student = Student.new(26, 'Paula', true, 'Grammar')

puts student.name