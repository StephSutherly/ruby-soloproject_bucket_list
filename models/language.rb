require_relative( '../db/sql_runner' )
require_relative( "../models/country.rb" )

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

  # def countries()
  #   sql = 'SELECT c.* FROM countries c
  #         INNER JOIN languages_countries t
  #         ON t.country_id = c.id
  #         WHERE t.language_id = $1'
  #   values = [@id]
  #   countries = SqlRunner.run(sql, values)
  #   return Country.map_items(countries)
  # end

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

    def delete()
      sql = 'DELETE FROM languages
      WHERE id = $1'
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = 'SELECT * FROM languages WHERE id = $1'
      values = [id]
      language = SqlRunner.run(sql, values)
      result = Language.new(language.first)
      return result
    end

  def self.all
    sql = 'SELECT * FROM languages'
    languages = SqlRunner.run(sql)
    return Language.map_items(languages)
  end

  def self.speaks(can_speak)
    sql = 'SELECT * FROM languages WHERE can_speak = $1'
    values = [can_speak]
    languages = SqlRunner.run(sql, values)
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
