require_relative 'book'

RSpec.describe Book do
  describe '#initialize' do
    it 'sets title, author, and initializes an empty rentals array' do
      book = Book.new('God is for all', 'wolter')

      expect(book.title).to eq('God is for all')
      expect(book.author).to eq('wolter')
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds the rental to the rentals array' do
      book = Book.new('2023', 'Anite Evelyn')
      rental = double('rental')

      book.add_rental(rental)

      expect(book.rentals).to include(rental)
    end
  end
end
