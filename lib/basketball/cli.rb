class Basketball::CLI
  def call
    list teams
  end

  def list_teams
    puts "Hello welcome to the basketball cli please enter the number of the team you would like to see"
    puts"
    1. Atlanta Hawks
    2. Boston Celtics
    3. Broklyn Nets
    4. Charlote Hornets
    5. Chicago Bulls
    "
  end
end
