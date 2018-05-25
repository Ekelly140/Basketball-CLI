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
