require_relative( '../db/sql_runner' )

class Country

attr_reader :id
attr_accessor :name, :country_visits, :visited_country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visits_to_country = options['country_visits']
    @has_visited_country = options['has_visited_country']
  end

  def save()
    sql = 'INSERT INTO countries
    (
      name,
      visits_to_country,
      has_visited_country
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id'
    values = [@name, @visits_to_country, @has_visited_country]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
