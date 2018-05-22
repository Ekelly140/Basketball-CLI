class Basketball::Player
  attr_accessor :name, :number, :position, :points, :assisst, :rebounds, :team

  @@all = []

  def initialize(player_info)
     player_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self
  end

  def get_player
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.downcase
      case input
        when "1"
          puts "Give the stats of Carmelo Anthony"
        when "2"
          puts "Give the stats of Lebron James"
        when "3"
          puts "Give the stats of Anthony Davis"
        when "4"
          puts "Give the stats of Kyrie Erving"
        when "5"
          puts "Give the stats of Kevin Durant"
        else
          puts "Invalid Entry! Please enter a number of a player or exit"
          list_players
        end
    end
  end


end
