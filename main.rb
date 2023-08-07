require_relative 'app_controller'

def display_options
  puts 'Please choose one of the options: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person ID'
  puts '7 - Exit'
end

def main
  app_controller = AppController.new
  app_controller.run(app_controller)
end

main