require("pry-byebug")
require_relative( "../models/country.rb" )
# require_relative( "../models/city.rb" )

#This is where I will seed data into my database.
#Class.delete_all

#instantiate class
country1 = Country.new({
  "name" => "South Africa",
  "visits_to_country" => "7",
  "has_visited_country" => "true"
  })

#instance.save

country1.save

binding.pry
nil
