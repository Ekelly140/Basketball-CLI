require 'nokogiri'
require 'open-uri'



class Basketball::TeamScrapper
  attr_accessor :team_name, :team_url

  def self.scrape_index_page(team_url)
    index = Nokogiri::HTML(open(team_url))
    teams = []
    index.css("div.team__list_wrapper").each do |team|
      team.css("div.team__list").each do |info|
        link = info.css("a").attr("href").value
        team_name = info.css(".logo").attr("alt").value
        stats = Nokogiri::HTML(open("http://nba.com#{link}"))
        wins = stats.css("#1610612737")
        binding.pry
        teams << {name: team_name, team_url: link}
      end
    end
    teams
  end
end
