require_relative( '../db/sql_runner' )
require_relative( "../models/language.rb" )

class Language

attr_reader :id
attr_accessor :name, :can_speak

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @can_speak = options['can_speak']
  end

end
