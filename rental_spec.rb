require 'date'
require_relative 'rental'

RSpec.describe Rental do
  let(:book) { double('book', rentals: []) }
  let(:person) { double('person', rentals: []) }

  describe '#initialize' do
    it 'sets date, person, and book attributes' do
      date = Date.new(2023, 8, 9)
      rental = Rental.new(date, book, person)

      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds itself to the person and book rentals' do
      rental = Rental.new(Date.new(2023, 8, 9), book, person)

      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
