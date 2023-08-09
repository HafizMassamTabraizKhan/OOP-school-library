require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

module PreserveData
  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_books
    books_list = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    save_to_file('books.json', books_list)
  end

  def save_people
    people_list = @persons.map do |person|
      if person.title == 'Student'
        {
          id: person.id.to_s, name: person.name, age: person.age,
          parent_permission: person.parent_permission, classroom: person.classroom.label,
          title: person.title
        }
      else
        {
          id: person.id.to_s, name: person.name, age: person.age,
          specialization: person.specialization, title: person.title
        }
      end
    end
    save_to_file('persons.json', people_list)
  end

  def save_rentals
    rentals_list = []
    @rentals.each do |rental|
      rental_item = {
        date: rental.date,
        book: {
          title: rental.book.title, author: rental.book.author
        },
        person: {
          id: rental.person.id, name: rental.person.name, age: rental.person.age, title: rental.person.title
        }
      }
      if rental.person.title == 'Student'
        rental_item[:person][:classroom] = rental.person.classroom.label
        rental_item[:person][:parent_permission] = rental.person.parent_permission
      else
        rental_item[:person][:specialization] = rental.person.specialization
      end
      rentals_list << rental_item
    end
    save_to_file('rentals.json', rentals_list)
  end
end
