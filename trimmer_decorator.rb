require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return if @name.correct_name.length <= 10

    @name.correct_name[0...10]
  end
end
