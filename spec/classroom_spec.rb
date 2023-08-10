require_relative '../classroom'

RSpec.describe Classroom do
  describe '#add_student' do
    it 'assigns the classroom to the student and adds them to the students array' do
      classroom = Classroom.new('History')
      student = double('student')
      allow(student).to receive(:classroom=)

      classroom.add_student(student)

      expect(student).to have_received(:classroom=).with(classroom).once
      expect(classroom.students).to include(student)
    end
  end
end
