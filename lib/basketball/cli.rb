class Basketball::CLI
  def call
    puts "Hello welcome to the basketball cli please enter the number of the team you would like to see or type exit to quit"
    list_teams
    get_team

  end

  def list_teams

    puts"
    1. Atlanta Hawks
    2. Boston Celtics
    3. Broklyn Nets
    4. Charlote Hornets
    5. Chicago Bulls
    "
  end

  def list_players
    puts "
    1. Carmelo Anthony
    2. Lebron James
    3. Anthony Davis
    4. Kyrie Erving
    5. Kevin Durant
    "
  end


  def get_team
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.downcase
      case input
        when "1"
          puts "Give info about The Hawks, here are the players"
          list_players
        when "2"
          puts "Give info about The Celtics, here are the players"
          list_players
        when "3"
          puts "Give info about The Nets, here are the players"
          list_players
        when "4"
          puts "Give info about The Hornets, here are the players"
          list_players
        when "5"
          puts "Give info about The Bulls, here are the players"
          list_players
        else
          puts "Invalid Entry! Please enter a number of a team or exit"
          list_teams
        end
    end
  end

end
