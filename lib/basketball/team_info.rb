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

  def list_players
    @players.each_with_index {|player, index| puts "#{index + 1} #{player.name}"}
  end


  def self.get_team
    input = nil

    while input != "exit"
      input = gets.chomp
      input = input.to_i if input.downcase != "exit"

      if input > 0 && input <= @@all.length
        puts @@all[input - 1].name
      else
          puts "Invalid Entry! Please enter a number of a team or exit"
      end
    end
  end



end
