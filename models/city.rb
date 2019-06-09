require_relative( '../db/sql_runner' )

class City

attr_reader :id
attr_accessor :name, :visits_to_city, :has_visited_city, :country_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visits_to_city = options['visits_to_city'].to_i
    @has_visited_city = options['has_visited_city']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = 'INSERT INTO cities
    (
      name,
      visits_to_city,
      has_visited_city,
      country_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id'
    values = [@name, @visits_to_city, @has_visited_city, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


end
