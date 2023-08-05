require_relative 'person'

class Student < Person
  attr_reader :classroom, :title

  def initialize(classroom:, age:, name: 'unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @title = 'Student'
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
