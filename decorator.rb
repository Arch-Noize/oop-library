require_relative 'nameable'

class Decorator < Nameable
  attr_accessor :names

  def initialize(names)
    super
    @names = names
  end

  def correct_name
    @names.correct_name
  end
end