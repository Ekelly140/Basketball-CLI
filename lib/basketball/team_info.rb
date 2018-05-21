class Basketball::Team
  attr_accessor :name, :team_url, :team_info
  @@all = []
  @@players = []

  def initialize(team_info)
      team_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self
  end

  def self.create_from_collection(team_array)
    team_array.each {|team| Basketball::Team.new(team)}
  end


  def self.list_teams
      @@all.each_with_index do |team, index|
      puts "#{index + 1} #{team.name}"
    end
  end

  def self.list_players
    @@players.each_with_index {|player, index| puts "#{index + 1} #{player.name}"}
  end


  def self.get_team
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.downcase
      case input
        when "1"
          puts "Give info about The Hawks, here are the players"
          list_players
          get_player
        when "2"
          puts "Give info about The Celtics, here are the players"
          list_players
          get_player
        when "3"
          puts "Give info about The Nets, here are the players"
          list_players
          get_player
        when "4"
          puts "Give info about The Hornets, here are the players"
          list_players
          get_player
        when "5"
          puts "Give info about The Bulls, here are the players"
          list_players
          get_player
        else
          puts "Invalid Entry! Please enter a number of a team or exit"
          list_teams
          get_player
        end
    end
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
