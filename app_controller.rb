require_relative 'app'

class AppController
  def initialize
    @app = App.new
  end

  def run(app_controller)
    app_intro(app_controller)
  end

  def app_intro(app_controller)
    puts 'Welcome to the School Library App!'
    loop do
      display_options
      option = app_controller.take_input
      app_controller.option_methods(option)

      break if option == 7
    end
  end

  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    until option >= 1 || option <= 7
      puts 'Please enter a number between 1 and 7!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end

  def option_methods(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals_of_person
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
