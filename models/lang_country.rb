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

end
