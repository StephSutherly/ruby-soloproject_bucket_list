require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/country_controller')
require_relative('controllers/city_controller')
require_relative('controllers/attraction_controller')

get '/' do
  @visited_countries = Country.visited(true)
  @unvisited_countries = Country.visited(false)
  erb(:index)
end
