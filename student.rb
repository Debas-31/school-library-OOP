require './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
