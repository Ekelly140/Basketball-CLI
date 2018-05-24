class Basketball::Player
  attr_accessor :name, :number, :team, :age, :years, :player_url, :birthday

  @@all = []

  def initialize(player_info)
     player_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self

  end

  def team=(team)
    @team = team
    @team.add_player(self)
  end

  def self.create_from_collection(player_array)
    player_array.each {|player| Basketball::Player.new(player)}
  end

  def self.get_player
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.to_i if input.downcase != "exit"

      if input > 0 && input <= @@all.length
        player = @@all[input - 1]
        puts "#{player.name} is number #{player.number} for the #{player.team.name}. Born on #{player.birthday} #{player.name} is #{player.age} years old and has been in the league for #{player.years} years. If you wish to learn more about #{player.name} his stats can be found at nba.com#{player.player_url}"
        input = "exit"
      else
          puts "Invalid Entry! Please enter a number of a player or exit."
      end
    end
  end


end
