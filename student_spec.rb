require_relative 'student'
require_relative 'classroom'

RSpec.describe Student do
  let(:classroom) { instance_double('Classroom', students: []) }
  let(:parent_permission) { true }

  describe '#initialize' do
    it 'sets attributes correctly' do
      student = Student.new(classroom, 16, 'wolter Benny', parent_permission: parent_permission)

      expect(student.name).to eq('wolter Benny')
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to eq(true)
      expect(student.title).to eq('Student')
    end
  end

  describe '#classroom=' do
    it 'adds the student to the classroom' do
      student = Student.new(classroom, 16)

      expect(classroom.students).to receive(:push).with(student)
      student.classroom = classroom
    end

    it 'does not add the student to the classroom if already included' do
      student = Student.new(classroom, 16)
      allow(classroom.students).to receive(:include?).with(student).and_return(true)

      expect(classroom.students).not_to receive(:push)
      student.classroom = classroom
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      student = Student.new(classroom, 16)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
