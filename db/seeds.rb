require("pry-byebug")
require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/attraction.rb" )
require_relative( '../models/language.rb' )
require_relative( '../models/lang_country.rb' )

LangCountry.delete_all
Attraction.delete_all
City.delete_all
Country.delete_all
Language.delete_all

language1 = Language.new({
  "name" => "English",
  "can_speak" => "true"
  })

language2 = Language.new({
  "name" => "French",
  "can_speak" => "true"
  })

language3 = Language.new({
  "name" => "Swedish",
  "can_speak" => "false"
  })

language1.save
language2.save
language3.save

country1 = Country.new({
  "name" => "South Africa",
  "continent" => "Africa",
  "visits_to_country" => "7",
  "has_visited_country" => "true"
  })

country2 = Country.new({
  "name" => "France",
  "continent" => "Europe",
  "visits_to_country" => "3",
  "has_visited_country" => "true"
  })

country3 = Country.new({
  "name" => "Turkey",
  "continent" => "Europe",
  "visits_to_country" => "1",
  "has_visited_country" => "true"
  })

country4 = Country.new({
  "name" => "Peru",
  "continent" => "South America",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country5 = Country.new({
  "name" => "Zimbabwe",
  "continent" => "Africa",
  "visits_to_country" => "3",
  "has_visited_country" => "true"
  })

country6 = Country.new({
  "name" => "New Zealand",
  "continent" => "Oceania",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country7 = Country.new({
  "name" => "Sweden",
  "continent" => "Europe",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country8 = Country.new({
  "name" => "Germany",
  "continent" => "Europe",
  "visits_to_country" => "1",
  "has_visited_country" => "true"
  })

country9 = Country.new({
  "name" => "Belgium",
  "continent" => "Europe",
  "visits_to_country" => "1",
  "has_visited_country" => "true"
  })

country1.save
country2.save
country3.save
country4.save
country5.save
country6.save
country7.save
country8.save
country9.save

lang_country1 = LangCountry.new({
  "language_id" => language2.id,
  "country_id" => country2.id
  })

lang_country2 = LangCountry.new({
  "language_id" => language3.id,
  "country_id" => country7.id
  })

lang_country3 = LangCountry.new({
  "language_id" => language1.id,
  "country_id" => country1.id
  })

lang_country1.save
lang_country2.save
lang_country3.save

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

  attraction1 = Attraction.new({
    "name" => "Eiffel Tower",
    "city_id" => city2.id,
    "review" => "Amazing views but really long queue!"
    })

  attraction2 = Attraction.new({
    "name" => "The Louvre",
    "city_id" => city2.id,
    "review" => "Could have spent three weeks here and still not seen it all!"
    })

  attraction3 = Attraction.new({
    "name" => "Jardin des plantes",
    "city_id" => city1.id,
    "review" => "Beautiful and enchanting gardens - great with kids"
    })

attraction1.save
attraction2.save
attraction3.save

binding.pry
nil
