require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/country_controller')
require_relative('controllers/city_controller')
require_relative('controllers/attraction_controller')
require_relative('controllers/language_controller')
# require_relative('controllers/lang_country_controller')

get '/' do
  @visited_countries = Country.visited(true)
  @unvisited_countries = Country.visited(false)
  @spoken_languages = Language.speaks(true)
  erb(:index)
end
