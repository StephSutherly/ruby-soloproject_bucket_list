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

  def update()
    sql = 'UPDATE cities SET (
    name,
    visits_to_city,
    has_visited_city,
    country_id
    ) =
    (
    $1, $2, $3, $4
    )
    WHERE id = $5'
    values = [@name, @visits_to_city, @has_visited_city, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM cities
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM cities
    WHERE id = $1'
    values = [id]
    city = SqlRunner.run(sql, values)
    result = City.new(city.first)
    return result
  end 

  def self.all
    sql = "SELECT * FROM cities"
    cities = SqlRunner.run(sql)
    return City.map_items(cities)
  end

  def self.map_items(city_data)
    result = city_data.map { |city| City.new(city) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM cities;"
    SqlRunner.run(sql)
  end

end
