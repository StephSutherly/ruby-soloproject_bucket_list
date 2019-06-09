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

end
