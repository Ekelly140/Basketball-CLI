class Basketball::CLI
  def call
    list_teams
    get_team
  end

  def list_teams
    puts "Hello welcome to the basketball cli please enter the number of the team you would like to see or type exit to quit"
    puts"
    1. Atlanta Hawks
    2. Boston Celtics
    3. Broklyn Nets
    4. Charlote Hornets
    5. Chicago Bulls
    "
  end

  def get_team
    input = nil
  
    while input != "exit"
      input = gets.chomp
      input = input.downcase
      case input
        when "1"
          puts "Give info about The Hawks"
        when "2"
          puts "Give info about The Celtics"
        when "3"
          puts "Give info about The Nets"
        when "4"
          puts "Give info about The Hornets"
        when "5"
          puts "Give info about The Bulls"
        else
          puts "Invalid Entry! Please enter a number of a team or exit"
          list_teams
        end
    end
  end
end
