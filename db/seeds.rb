require("pry-byebug")
require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )

Country.delete_all

country1 = Country.new({
  "name" => "South Africa",
  "visits_to_country" => "7",
  "has_visited_country" => "true"
  })

country2 = Country.new({
  "name" => "France",
  "visits_to_country" => "3",
  "has_visited_country" => "true"
  })

country1.save
country2.save

 city1 = City.new({
   "name" => "Nantes",
   "visits_to_city" => "1",
   "has_visited_city" => "true",
   "country_id" => country2.id
   })

 city2 = City.new({
   "name" => "Paris",
   "visits_to_city" => "3",
   "has_visited_city" => "true",
   "country_id" => country2.id
   })

 city3 = City.new({
   "name" => "Johannesburg",
   "visits_to_city" => "15",
   "has_visited_city" => "true",
   "country_id" => country1.id
   })

city1.save
city2.save
city3.save

binding.pry
nil
