require_relative 'user.rb'

class Main
  def ui
    puts %{
      1 - Create User
      2 - Create Survey
    }
    variant = gets.chomp.to_i
    case variant
    when 1
      create_user
    end
  end

  def users_example
    p User.add({name: "Vova", email: "Test"})
    p User.add({name: "Vova2", email: "Test"})
  end

  private

  def create_user
    puts "Введи имя"
    name = gets.chomp
    puts "Введи email"
    email = gets.chomp
    user = User.new(name, email)
    p user
  end
end

Main.new.users_example