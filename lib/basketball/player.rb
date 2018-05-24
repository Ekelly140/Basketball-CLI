class Basketball::Player
  attr_accessor :name, :number, :position, :points, :assisst, :rebounds, :team

  @@all = []

  def initialize(player_info)
     player_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self
  end

  def team=(team)
    @team = team
    player_team = team_find(team)
    player_team.add_player(self)
  end

  def self.create_from_collection(player_array)
    player_array.each {|player| Basketball::Player.new(team)}
  end

  def self.get_player
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.to_i if input.downcase != "exit"

      if input > 0 && input <= @@all.length
        player = @@all[input - 1]
        puts "that is " + player.name
        input = "exit"
      else
          puts "Invalid Entry! Please enter a number of a player or exit."
      end
    end
  end


end
