class CreatePerson
  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def inputs_person
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    [age, name, parent_permission]
  end

  def create_student
    age, name, parent_permission = inputs_person
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      puts 'Student created successfully'
    end
    student
  end

  def inputs_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    [age, name, specialization]
  end

  def create_teacher
    age, name, specialization = inputs_teacher
    teacher = Teacher.new(specialization, age, name)
    puts 'Teacher created successfully'
    teacher
  end
end
