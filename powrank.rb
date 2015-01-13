#powrank.rb
#scrapes ESPN's power rankings and prints a histogram of a team's ranking over the season
#Danny Grant

require 'nokogiri'
require 'open-uri'


week = 0
chargers = []

while week < 19 do
  rankings = Nokogiri::HTML(open("http://espn.go.com/nfl/powerrankings/_/week/#{week}"))
  rankings.css("tr").each do |team|
    if team.css("a").text == "Chargers"
      puts "Week #{week}"
      puts team.css("a").text
      puts team.css(".pr-rank").text
      chargers[week] = team.css(".pr-rank").text
    end
  end
  week += 1
end


