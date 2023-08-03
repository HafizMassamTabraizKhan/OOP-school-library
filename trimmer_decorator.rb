require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = super
    name.length > 10 ? name[0..9] : name
  end
end
