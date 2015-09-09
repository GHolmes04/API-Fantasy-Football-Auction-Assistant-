# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: 'greg@holmes.com',
  password_digest: 'greg',
  token: 1)
User.create(
  email: 'jeff@horn.com',
  password_digest: 'jeff',
  token: 2)

League.create(
  mfl_id: 26152,
  name: 'cashin',
  salary_cap: 200,
  roster_spots: 17,
  num_of_teams: 10)
League.create(
  mfl_id: 'null',
  name: 'Gawdi',
  salary_cap: 200,
  roster_spots: 17,
  num_of_teams: 10)
Franchise.create(
  user_id: 1,
  league_id: 1,
  name: 'Mobile Holmes')
Franchise.create(
  user_id: 2,
  league_id: 2,
  name: 'Jeff Hornets')
Roster.create(
  franchise_id: 1,
  league_id: 1)
Roster.create(
  franchise_id: 2,
  league_id: 2)









