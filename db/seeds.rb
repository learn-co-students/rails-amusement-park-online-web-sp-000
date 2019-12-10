# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
attractions = [{name: "Animal Kingdom"},
         {name: "Magic Kingdom"},
         {name: "Epcot"}]

attractions.each do |attraction|
  Attraction.create(attraction)

  
end