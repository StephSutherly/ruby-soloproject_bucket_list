require_relative( '../db/sql_runner' )
require_relative( "../models/city.rb" )

class Country

attr_reader :id
attr_accessor :name, :visits_to_country, :has_visited_country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visits_to_country = options['visits_to_country'].to_i
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

  def cities()
    sql = 'SELECT * FROM cities WHERE country_id = $1'
    values = [@id]
    cities = SqlRunner.run(sql, values)
    return City.map_items(cities)
  end

  def update()
    sql = 'UPDATE countries
    SET
    (
      name,
      visits_to_country,
      has_visited_country
      ) =
      (
        $1, $2, $3
        )
      WHERE id = $4'
      values = [@name, @visits_to_country, @has_visited_country, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = 'DELETE FROM countries
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM countries WHERE id = $1'
    values = [id]
    country = SqlRunner.run(sql, values)
    result = Country.new(country.first)
    return result
  end

  def self.all
    sql = 'SELECT * FROM countries'
    countries = SqlRunner.run(sql)
    return Country.map_items(countries)
  end

  def self.map_items(country_data)
    result = country_data.map { |country| Country.new(country) }
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM countries'
    SqlRunner.run(sql)
  end

end
