require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/attraction.rb' )
require_relative( '../models/language.rb' )
# require_relative('controllers/lang_country_controller')
also_reload( '../models/*' )

# #NEW
# get '/languages/new' do
#   @languages = Language.all
#   @countries = Country.all
#   erb(:"languages/new")
# end
#
# #CREATE
# post '/languages' do
#   @language = Language.new(params)
#   @language.save
#   erb(:"languages/create")
# end

#INDEX
get '/languages' do
  @languages = Language.all()
  erb(:"languages/index")
end

#LANGUAGES SPOKEN
get '/languages/spoken' do
  @languages = Language.speaks(true)
  erb(:"languages/spoken")
end

#LANGUAGES NOT SPOKEN
get '/languages/unspoken' do
  @languages = Language.speaks(false)
  erb(:"languages/unspoken")
end

#SHOW
get '/languages/:id' do
  @language = Language.find(params['id'].to_i)
  @countries = @language.countries
  erb(:"languages/show")
end
