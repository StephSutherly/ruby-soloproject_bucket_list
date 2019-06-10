require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/attraction.rb' )
also_reload( '../models/*' )

#NEW
get '/cities/new' do
  @countries = Country.all
  @cities = City.all
  @attractions = Attraction.all
  erb(:"cities/new")
end

#CREATE
post '/cities' do
  @city = City.new(params)
  @city.save
  erb(:"cities/create")
end

#INDEX
get '/cities' do
  @cities = City.all()
  erb(:"cities/index")
end

#SHOW
get '/cities/:id' do
  @city = City.find(params['id'].to_i)
  @countries = Country.all
  erb(:"cities/show")
end
