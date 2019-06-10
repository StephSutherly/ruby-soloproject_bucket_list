require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/attraction.rb' )
also_reload( '../models/*' )

#NEW
get '/attractions/new' do
  @cities = City.all
  @attractions = Attraction.all
  erb(:"attractions/new")
end

#CREATE
post '/attractions' do
  @attraction = Attraction.new(params)
  @attraction.save
  erb(:"attractions/create")
end
