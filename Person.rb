class Person
    def initialize(age, name = "Unknown", parent_permission = true)
      @id = Random.rand(1..1000)
      @age = age
      @name = name
      @parent_permission = parent_permission
    end

    # Getters
    def id 
      @id
    end

    def age 
      @age
    end

    def name 
      @name
    end

    # Setters
    def name=(name) 
      @name = name
    end

    def age=(age) 
        @age = age
    end

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

person = Person.new(24, 'Santiago', false)

puts person.name
puts person.age
puts person.can_use_services?