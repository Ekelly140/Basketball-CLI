require 'nokogiri'
require 'open-uri'



class Basketball::PlayerScrapper
  attr_accessor :player_name, :player_url

  def self.scrape_index_page(team_url)
    index = Nokogiri::HTML(open("http://nba.com#{team_url}"))
    players = []

    index.css(".nba-player-index__row").each do |player|
      binding.pry

      name = player.css(".nba-player-index__name").text
      link = player.css("a").attr("href").value
      players << {player_name: name, player_url: link}
      end
    players

  end

end
