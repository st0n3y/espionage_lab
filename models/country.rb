require_relative( '../db/sql_runner' )

class Country

  attr_reader :id, :name

  def initialize( params )
    @id = params[ 'id' ].to_i
    @name = name[ 'name' ]
  end

  def save()
    sql = "INSERT INTO countries ( name ) 
          VALUES ( '#{ @name }' ) 
          RETURNING *;"
    return Country.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM countries;"
    return Country.map_items( sql )
  end

  def self.delete_all
    sql = "DELETE FROM countries;"
    SqlRunner.run( sql )
  end





  def self.map_items( sql )
    countries = SqlRunner.run( sql )
    result = countries.map { |country| Country.new( country ) }
    return result
  end

  def self.map_item( sql )
    result = Country.map_items( sql )
    return result.first
  end

end