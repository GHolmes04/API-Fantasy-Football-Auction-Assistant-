# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by(email: 'greg@holmes.com') do |user|
  user.password_digest = 'greg'
  user.token = 1
end

User.create!(
  email: 'jeff@horn.com',
  password_digest: 'jeff',
  token: 2)

League.create!(
  mfl_id: 26152,
  name: 'cashin',
  salary_cap: 200,
  roster_spots: 17,
  num_of_teams: 10)
League.create!(
  mfl_id: 'null',
  name: 'Gawdi',
  salary_cap: 200,
  roster_spots: 17,
  num_of_teams: 10)
Franchise.create(
  user_id: 1,
  league_id: 1,
  name: 'Mobile Holmes')
Franchise.create!(
  user_id: 2,
  league_id: 2,
  name: 'Jeff Hornets')
Player.create!(
  name: 'Antony Donovan')
Roster.create!(
  franchise_id: 1,
  player_id: 1)
Roster.create!(
  franchise_id: 2,
  player_id: 1)



require 'net/http'
require 'json'

# First, we need to get a JSON response with all the players.

url = URI.parse('http://football.myfantasyleague.com/2015/export?TYPE=players&JSON=1')
response = Net::HTTP.get(url)
hash = JSON.parse(response, symbolize_names: true)
players = hash[:players][:player]

# Then, we need to go through all the players in the JSON response and create a
# local copy in our database for that player.

players.each do |player|
  Player.find_or_create_by(mfl_id: player[:id]) do |p|
    p.position = player[:position]
    p.name = player[:name]
    p.team = player[:team]
  end
end
