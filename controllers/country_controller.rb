require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )
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
