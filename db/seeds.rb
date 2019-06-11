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

language4 = Language.new({
  "name" => "Arabic",
  "can_speak" => "true"
  })

language5 = Language.new({
  "name" => "Spanish",
  "can_speak" => "true"
  })

language6 = Language.new({
  "name" => "Russian",
  "can_speak" => "false"
  })

language7 = Language.new({
  "name" => "German",
  "can_speak" => "true"
  })

language8 = Language.new({
  "name" => "Shona",
  "can_speak" => "false"
  })

language9 = Language.new({
  "name" => "Xhosa",
  "can_speak" => "false"
  })

language10 = Language.new({
  "name" => "Berber",
  "can_speak" => "false"
  })

language11 = Language.new({
  "name" => "Portugese",
  "can_speak" => "false"
  })

language12 = Language.new({
  "name" => "Estonian",
  "can_speak" => "false"
  })

language13 = Language.new({
  "name" => "Czech",
  "can_speak" => "false"
  })

language14 = Language.new({
  "name" => "Afrikaans",
  "can_speak" => "false"
  })

language15 = Language.new({
  "name" => "Turkish",
  "can_speak" => "false"
  })

language1.save
language2.save
language3.save
language4.save
language5.save
language6.save
language7.save
language8.save
language9.save
language10.save
language11.save
language12.save
language13.save
language14.save
language15.save

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

country10 = Country.new({
  "name" => "Great Britain",
  "continent" => "Europe",
  "visits_to_country" => "20",
  "has_visited_country" => "true"
  })

country11 = Country.new({
  "name" => "Spain",
  "continent" => "Europe",
  "visits_to_country" => "2",
  "has_visited_country" => "true"
  })

country12 = Country.new({
  "name" => "Czech Republic",
  "continent" => "Europe",
  "visits_to_country" => "1",
  "has_visited_country" => "true"
  })

country13 = Country.new({
  "name" => "Estonia",
  "continent" => "Europe",
  "visits_to_country" => "1",
  "has_visited_country" => "true"
  })

country14 = Country.new({
  "name" => "United States",
  "continent" => "North America",
  "visits_to_country" => "6",
  "has_visited_country" => "true"
  })

country15 = Country.new({
  "name" => "Russia",
  "continent" => "Europe",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country16 = Country.new({
  "name" => "Portugal",
  "continent" => "Europe",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country17 = Country.new({
  "name" => "Morocco",
  "continent" => "Africa",
  "visits_to_country" => "4",
  "has_visited_country" => "true"
  })

country18 = Country.new({
  "name" => "Argentina",
  "continent" => "South America",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
  })

country19 = Country.new({
  "name" => "Canada",
  "continent" => "North America",
  "visits_to_country" => "0",
  "has_visited_country" => "false"
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
country10.save
country11.save
country12.save
country13.save
country14.save
country15.save
country16.save
country17.save
country18.save
country19.save

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

lang_country4 = LangCountry.new({
  "language_id" => language8.id,
  "country_id" => country5.id
  })

lang_country5 = LangCountry.new({
  "language_id" => language9.id,
  "country_id" => country1.id
  })

lang_country6 = LangCountry.new({
  "language_id" => language14.id,
  "country_id" => country1.id
  })

lang_country7 = LangCountry.new({
  "language_id" => language15.id,
  "country_id" => country3.id
  })

lang_country8 = LangCountry.new({
  "language_id" => language1.id,
  "country_id" => country6.id
  })

lang_country9 = LangCountry.new({
  "language_id" => language7.id,
  "country_id" => country8.id
  })

lang_country10 = LangCountry.new({
  "language_id" => language2.id,
  "country_id" => country9.id
  })

lang_country11 = LangCountry.new({
  "language_id" => language1.id,
  "country_id" => country10.id
  })

lang_country12 = LangCountry.new({
  "language_id" => language5.id,
  "country_id" => country11.id
  })

lang_country13 = LangCountry.new({
  "language_id" => language13.id,
  "country_id" => country12.id
  })

lang_country14 = LangCountry.new({
  "language_id" => language12.id,
  "country_id" => country13.id
  })

lang_country15 = LangCountry.new({
  "language_id" => language1.id,
  "country_id" => country14.id
  })

lang_country16 = LangCountry.new({
  "language_id" => language6.id,
  "country_id" => country15.id
  })

lang_country17 = LangCountry.new({
  "language_id" => language11.id,
  "country_id" => country16.id
  })

lang_country18 = LangCountry.new({
  "language_id" => language2.id,
  "country_id" => country17.id
  })

lang_country19 = LangCountry.new({
  "language_id" => language4.id,
  "country_id" => country17.id
  })

lang_country20 = LangCountry.new({
  "language_id" => language10.id,
  "country_id" => country17.id
  })

lang_country21 = LangCountry.new({
  "language_id" => language5.id,
  "country_id" => country18.id
  })

lang_country22 = LangCountry.new({
  "language_id" => language1.id,
  "country_id" => country19.id
  })

lang_country23 = LangCountry.new({
  "language_id" => language2.id,
  "country_id" => country19.id
  })

lang_country1.save
lang_country2.save
lang_country3.save
lang_country4.save
lang_country5.save
lang_country6.save
lang_country7.save
lang_country8.save
lang_country9.save
lang_country10.save
lang_country11.save
lang_country12.save
lang_country13.save
lang_country14.save
lang_country15.save
lang_country16.save
lang_country17.save
lang_country18.save
lang_country19.save
lang_country20.save
lang_country21.save
lang_country22.save
lang_country23.save

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
