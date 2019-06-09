require_relative( '../db/sql_runner' )

class Attraction

attr_reader :id
attr_accessor :name, :city_id, :review

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @city_id = options['city_id'].to_i
    @review = options['review']
  end

  def save()
    sql = 'INSERT INTO attractions
    (
      name,
      city_id,
      review
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id'
    values = [@name, @city_id, @review]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = 'UPDATE attractions SET (
    name,
    city_id,
    review
    ) =
    (
    $1, $2, $3
    )
    WHERE id = $4'
    values = [@name, @city_id, @review, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM attractions
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM attractions
    WHERE id = $1'
    values = [id]
    attraction = SqlRunner.run(sql, values)
    result = Attraction.new(attraction.first)
    return result
  end

  def self.all
    sql = "SELECT * FROM attractions"
    attractions = SqlRunner.run(sql)
    return Attraction.map_items(attractions)
  end

  def self.map_items(attraction_data)
    result = attraction_data.map { |attraction| Attraction.new(attraction) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM attractions;"
    SqlRunner.run(sql)
  end


end
