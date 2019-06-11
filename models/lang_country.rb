require_relative( '../db/sql_runner' )

class LangCountry

  attr_reader( :language_id, :country_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @language_id = options['language_id'].to_i
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO lang_countries
    (
      language_id,
      country_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@language_id, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM lang_countries"
    results = SqlRunner.run( sql )
    return results.map { |biting| Biting.new( biting ) }
  end

  def language()
    sql = "SELECT * FROM languages
    WHERE id = $1"
    values = [@language_id]
    results = SqlRunner.run( sql, values )
    return Language.new( results.first )
  end

  def country()
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [@country_id]
    results = SqlRunner.run( sql, values )
    return Country.new( results.first )
  end

  def self.all
    sql = 'SELECT * FROM lang_countries'
    lang_countries = SqlRunner.run(sql)
    return LangCountry.map_items(lang_countries)
  end

  def self.map_items(lang_country_data)
    result = lang_country_data.map { |lang_country| LangCountry.new(lang_country) }
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM lang_countries'
    SqlRunner.run(sql)
  end


end
