require_relative( '../db/sql_runner' )

class Spy

  attr_reader :id, :name

  def initialize( params )
    @id = params[ 'id' ].to_i
    @name = options[ 'name' ].to_i
  end

  def save()
    sql = "INSERT INTO spies (name)
          VALUES ( '#{ @name }' )
          RETURNING *;"
    return Spy.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM spies;"
    return Spy.map_items( sql )
  end

  def self.delete_all
    sql = "DELETE FROM spies;"
    SqlRunner.run( sql )
  end




  def self.map_items( sql )
    spies = SqlRunner.run( sql )
    result = spies.map { |spy| Spy.new( spy ) }
    return result
  end

  def self.map_item( sql )
    result = Spy.map_items( sql )
    return result.first
  end

end