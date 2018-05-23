require 'nokogiri'
require 'open-uri'



class Basketball::PlayerScrapper
  attr_accessor :player_name, :player_url

  def self.scrape_index_page(team_url)
    index = Nokogiri::HTML(open("http://nba.com#{team_url}"))
    players = []
    index.css(".row nba-player-index__row").each do |player|
      name = player.css(".nba-player-index__name").text
      link = player.css("a").attr("href").value
      team_name = info.css(".logo").attr("alt").value
      stats = Nokogiri::HTML(open("http://nba.com#{link}"))
      #wins = stats.css("#1610612737")
      players << {player_name: name, player_url: link}
      end
    end
    players
  end
end
