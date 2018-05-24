class Basketball::Team
  attr_accessor :name, :team_url, :team_info
  @@all = []

  def initialize(team_info)
     team_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self
      @players = []
  end

  def self.create_from_collection(team_array)
    team_array.each {|team| Basketball::Team.new(team)}
  end


  def self.list_teams
      @@all.each_with_index do |team, index|
      puts "#{index + 1} #{team.name}"
    end
  end

def self.find_team(team_name)
  @@all.each do |team|
    return team[name] if team[name] == team_name
  end

end

  def self.get_team
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.to_i if input.downcase != "exit"

      if input > 0 && input <= @@all.length
        team = @@all[input - 1]
        puts "Here are the players that play for the " + team.name + "."
        input = "exit"
      else
          puts "Invalid Entry! Please enter a number of a team or exit."
      end
    end
    team.team_url
  end

  def add_player(player)
    @players << player
  end

  def list_players
    @players.each_with_index {|player, index| puts "#{index + 1} #{player.name}"}
  end



end
