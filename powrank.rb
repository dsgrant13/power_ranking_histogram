#powrank.rb
#scrapes ESPN's power rankings and prints a histogram of a team's ranking over the season
#Danny Grant

require 'nokogiri'
require 'open-uri'
require 'chartkick'


week = 0
ranks = []

puts "Please enter the team you want a PR histogram for (Just the team name):"
team_name = gets.chomp.capitalize!

while week < 19 do
  rankings = Nokogiri::HTML(open("http://espn.go.com/nfl/powerrankings/_/week/#{week}"))
  rankings.css("tr").each do |team|
    if team.css("a").text == team_name
      ranks[week] = team.css(".pr-rank").text.to_i
    end
  end
  week += 1
end

week = 0
puts "#{team_name} Histogram"
ranks.each do |rank|
  puts "Week #{week}:" + "*"*rank + "(#{rank})"
  week += 1
end
