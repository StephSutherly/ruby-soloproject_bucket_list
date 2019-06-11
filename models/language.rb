require_relative( '../db/sql_runner' )

class Language

attr_reader :id
attr_accessor :name, :can_speak

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @can_speak = options['can_speak']
  end

  def save()
    sql = 'INSERT INTO languages
    (
      name,
      can_speak
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id'
    values = [@name, @can_speak]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
