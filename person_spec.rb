require_relative 'person'
require_relative 'nameable'

RSpec.describe Person do
  describe '#initialize' do
    it 'sets age, name, parent_permission, rentals, and id attributes' do
      person = Person.new(27, 'Jackie', parent_permission: true)

      expect(person.age).to eq(27)
      expect(person.name).to eq('Jackie')
      expect(person.parent_permission).to eq(true)
      expect(person.rentals).to eq([])
      expect(person.id).to be_an(Integer)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(24)

      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(16, 'kalampaya', parent_permission: true)

      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is underage and lacks parent permission' do
      person = Person.new(14, 'kabala', parent_permission: false)

      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the person\'s name' do
      person = Person.new(30, 'ALLAN')

      expect(person.correct_name).to eq('ALLAN')
    end
  end
end
