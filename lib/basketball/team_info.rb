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


      if input.to_i  > 0 && input.to_i <= @@all.length
        team = @@all[input.to_i - 1]
        puts ""
        puts "Here are the players that play for the " + team.name + "."
        puts ""
        input = "exit"
      elsif input == "exit"
        abort("Thank you for using the basketball cli!")
      else
        puts ""
        puts "Invalid Entry! Please enter a number of a team or exit."
        puts ""
      end
    end
    team
  end

  def add_player(player)
    @players << player
  end

  def list_players
    @players.each_with_index {|player, index| puts "#{index + 1} #{player.name}"}
  end



end
