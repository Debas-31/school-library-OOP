require './book'
require './student'
require './classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('math')
  end
  it 'Take label and students' do
    expect(@classroom.label).to eq 'math'
    expect(@classroom.students).to eq []
  end

  it 'should return only one student when adding a student' do
    person = Student.new(15, 'Harry', parent_permission: true)
    @classroom.add_student(person)
    expect(@classroom.students.length).to eq 1
  end

  it 'should return only one student when adding the same student ' do
    person = Student.new(15, 'Harry', parent_permission: true)
    @classroom.add_student(person)
    @classroom.add_student(person)
    @classroom.add_student(person)
    @classroom.add_student(person)
    expect(@classroom.students.length).to eq 1
  end

  it 'should return the number of student when adding students ' do
    person = Student.new(15, 'Harry', parent_permission: true)
    person2 = Student.new(28, 'Job', parent_permission: true)
    @classroom.add_student(person)
    @classroom.add_student(person2)
    expect(@classroom.students.length).to eq 2
  end

  it 'should return the classroom of student when adding students in the classroom' do
    person = Student.new(15, 'Harry', parent_permission: true)
    @classroom.add_student(person)
    expect(person.classroom).to eq @classroom
  end
end
