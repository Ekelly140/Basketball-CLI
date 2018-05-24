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

      if input.to_i > 0 && input.to_i <= @@all.length
        player = @@all[input.to_i - 1]
        puts ""
        puts "#{player.name} is number #{player.number} for the #{player.team.name}. Born on #{player.birthday} #{player.name} is #{player.age} years old and has been in the league for #{player.years} years. If you wish to learn more about #{player.name} his stats can be found at nba.com#{player.player_url}"
        puts ""
        puts "Enter the number of another player to view that players information, type list to recieve the list of players again, or type exit to quit the application."
        elsif input == "exit"
          puts""
        abort("Thank you for using the basketball cli!")
        elsif input == "list"
          puts ""
        player.team.list_players
        else
          puts ""
        puts "Invalid Entry! Please enter a number of a player or exit."
      end
    end
  end


end
