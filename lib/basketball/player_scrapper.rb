require 'nokogiri'
require 'open-uri'



class Basketball::PlayerScrapper


  def self.scrape_index_page(team_url, team)
    index = Nokogiri::HTML(open("http://nba.com#{team_url}"))
    players = []

    index.css(".nba-player-index__row").each do |player|
      player.css(".nba-player-index__trending-item").each do |items|
      link = items.css("a").attr("href").value
      name = items.css("a").attr("title").value
      number = items.css(".nba-player-trending-item__number").text
      player_page = Nokogiri::HTML(open("http://nba.com#{link}"))
      i = 1
      bday = ""
      age = 0
      years = 0
      player_page.css(".nba-player-vitals__bottom-info").each do |a|
        case i
        when 1
          bday = a.text
          bday = bday.gsub(/[ \n]/,"")
        when 2
          age = a.text
          age = age.gsub(/[years \n]/,"")
        when 5
          years = a.text
          years = years.gsub(/[ \n]/,"")
        end
        i += 1

      end
      players << {name: name, player_url: link, number: number, birthday: bday, age: age, years: years, team: team}
      end
    end

    players
  end

end

#<section class="nba-player-index__trending-item small-4 medium-3 large-2 team-atl-hawks">
#<span class="nba-player-trending-item__number">24</span>
#<div class="nba-player-index__details"><span>Guard</span><span><strong>6</strong> ft <strong>5</strong> in | <strong>201</strong> lbs</span></div>
#<p class="nba-player-vitals__top-info-imperial"><span>6 <abbr title="feet">ft</abbr></span><span>5 <abbr title="inches">in</abbr></span></p>
