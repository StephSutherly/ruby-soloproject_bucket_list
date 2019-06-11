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

  def update()
    sql = 'UPDATE languages
    SET
    (
      name,
      can_speak
      ) =
      (
        $1, $2
        )
      WHERE id = $3'
      values = [@name, @can_speak, @id]
      SqlRunner.run(sql, values)
    end

  def self.all
    sql = 'SELECT * FROM languages'
    languages = SqlRunner.run(sql)
    return Language.map_items(languages)
  end

  def self.map_items(language_data)
    result = language_data.map { |language| Language.new(language) }
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM languages'
    SqlRunner.run(sql)
  end

end
