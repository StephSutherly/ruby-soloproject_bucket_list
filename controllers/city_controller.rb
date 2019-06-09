require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
also_reload( '../models/*' )

#INDEX
get '/cities' do
  @cities = City.all()
  erb(:"cities/index")
end

#SHOW
