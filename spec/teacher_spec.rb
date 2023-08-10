require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'sets specialization, age, name, parent_permission, and title attributes' do
      teacher = Teacher.new('Math', 30, 'Mr. Joab')

      expect(teacher.specialization).to eq('Math')
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Mr. Joab')
      expect(teacher.parent_permission).to eq(true)
      expect(teacher.title).to eq('Teacher')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new('English', 35, 'Mr. Wolter')

      result = teacher.can_use_services?

      expect(result).to eq(true)
    end
  end
end
