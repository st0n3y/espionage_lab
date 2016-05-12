class Operations

  def initialize( params )
    @id = params[ 'id' ].to_i
    @country_id = params[ 'country_id' ].to_i
    @spy_id = params[ 'spy_id' ].to_i
  end

  def save()
    sql = "INSERT INTO operations (
          country_id,
          spy_id )
          VALUES ( #{ @country_id },
          #{ @spy_id }
          ) RETURNING *;"

    return Operation.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM operations;"

    return Operation.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM operations;"
    SqlRunner.run( sql )
  end

  def self.maps_items( sql )
    operations = SqlRunner.run( sql )
    result = operations.map { |operation| 
      Operation.new( operations ) }
    return result
  end

  def self.map_item( sql )
    result = Operation.map_items( sql )
    return result.first
  end

end