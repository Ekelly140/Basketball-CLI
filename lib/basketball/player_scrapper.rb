require 'nokogiri'
require 'open-uri'



class Basketball::PlayerScrapper


  def self.scrape_index_page(team_url)
    index = Nokogiri::HTML(open("http://nba.com#{team_url}"))
    players = []

    index.css(".nba-player-index__row").each do |player|
      player.css(".nba-player-index__trending-item").each do |items|
      link = items.css("a").attr("href").value
      name = items.css("a").attr("title").value
      number = items.css(".nba-player-trending-item__number").text
      players << {name: name, player_url: link, number: number}
      end
    end
    binding.pry

    players
  end

end

#<section class="nba-player-index__trending-item small-4 medium-3 large-2 team-atl-hawks">
#<span class="nba-player-trending-item__number">24</span>
#<div class="nba-player-index__details"><span>Guard</span><span><strong>6</strong> ft <strong>5</strong> in | <strong>201</strong> lbs</span></div>
