require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/attraction.rb' )
also_reload( '../models/*' )

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
