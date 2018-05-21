class Basketball::Player
  attr_accessor :name, :number, :position, :points, :assisst, :rebounds, :team

  @@all = []

  def initialize(player_info)
     player_info.each do |key, value|
     self.send("#{key}=", value)
     end
      @@all <<self
  end

end
