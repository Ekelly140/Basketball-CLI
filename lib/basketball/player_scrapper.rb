require 'nokogiri'
require 'open-uri'



class Basketball::PlayerScrapper
  attr_accessor :player_name, :player_url

  def self.scrape_index_page(team_url)
    index = Nokogiri::HTML(open("http://nba.com#{team_url}"))
    players = []

    index.css(".nba-player-index__row").each do |player|
      player.css(".nba-player-index__trending-item").each do |items|
      name = items.css(".nba-player-index__name").text
      link = items.css("a").attr("href").value
      players << {player_name: name, player_url: link}
      end
    end
    binding.pry
    players
  end

end

#<section class="nba-player-index__trending-item small-4 medium-3 large-2 team-atl-hawks">
