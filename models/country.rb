require_relative( '../db/sql_runner' )
require_relative( "../models/city.rb" )
require_relative( '../models/language.rb' )
require_relative( '../models/lang_country.rb' )

class Country

attr_reader :id
attr_accessor :name, :continent, :visits_to_country, :has_visited_country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @continent = options['continent']
    if options['visits_to_country']
      @visits_to_country = options['visits_to_country'].to_i
    else
      @visits_to_country = 0
    end
    if @visits_to_country == 0
      @has_visited_country = false
    else
      @has_visited_country = true
    end
  end

  def save()
    sql = 'INSERT INTO countries
    (
      name,
      continent,
      visits_to_country,
      has_visited_country
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id'
    values = [@name, @continent, @visits_to_country, @has_visited_country]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def cities()
    sql = 'SELECT * FROM cities WHERE country_id = $1'
    values = [@id]
    cities = SqlRunner.run(sql, values)
    return City.map_items(cities)
  end

  def languages()
    sql = 'SELECT l.* FROM languages l
          INNER JOIN lang_countries t
          ON t.language_id = l.id
          WHERE t.country_id = $1'
    values = [@id]
    languages = SqlRunner.run(sql, values)
    return Language.map_items(languages)
  end

  def update()
    sql = 'UPDATE countries
    SET
    (
      name,
      continent,
      visits_to_country,
      has_visited_country
      ) =
      (
        $1, $2, $3, $4
        )
      WHERE id = $5'
      values = [@name, @continent, @visits_to_country, @has_visited_country, @id]
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

  def self.visited(has_visited_country)
    sql = 'SELECT * FROM countries WHERE has_visited_country = $1'
    values = [has_visited_country]
    countries = SqlRunner.run(sql, values)
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
