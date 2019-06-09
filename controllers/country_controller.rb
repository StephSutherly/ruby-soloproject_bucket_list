require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )
also_reload( '../models/*' )

#INDEX
get '/countries' do
  @countries = Country.all()
  erb(:"countries/index")
end

#SHOW
