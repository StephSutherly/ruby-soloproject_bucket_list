require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/attraction.rb' )
require_relative( '../models/language.rb' )
# require_relative('controllers/lang_country_controller')
also_reload( '../models/*' )

#NEW
get '/countries/new' do
  @countries = Country.all
  @cities = City.all
  erb(:"countries/new")
end

#CREATE
post '/countries' do
  @country = Country.new(params)
  @country.save
  erb(:"countries/create")
end

#INDEX
get '/countries' do
  @countries = Country.all()
  erb(:"countries/index")
end

#COUNTRIES VISITED
get '/countries/visited' do
  @countries = Country.visited(true)
  erb(:"countries/visited")
end

#COUNTRIES NOT VISITED
get '/countries/unvisited' do
  @countries = Country.visited(false)
  erb(:"countries/unvisited")
end

#SHOW
get '/countries/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"countries/show")
end

#EDIT
get '/countries/:id/edit' do
  @country = Country.find(params['id'].to_i)
  @cities = City.all
  erb(:"countries/edit")
end

#UPDATE
post '/countries/:id' do
  @country = Country.new(params)
  @country.update()
  erb(:"countries/update")
end
