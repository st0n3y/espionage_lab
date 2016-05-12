require_relative( 'models/country.rb' )
require_relative( 'models/spy.rb' )
require_relative( 'models/operations.rb' )
require( 'pry-byebug' )

Operations.delete_all()
Country.delete_all()
Spy.delete_all()

country1 = Country.new( { 'name' => 'West Germany' })
country2 = Country.new( { 'name' => 'East Germany' } )
country3 = Country.new( { 'name' => 'USA' } )
country4 = Country.new( { 'name' => 'USSR' } )

c1 = country1.save
c2 = country2.save
c3 = country3.save
c4 = country4.save

spy1 = Spy.new( { 'name' => 'Yuri' } )
spy2 = Spy.new( { 'name' => 'James' } )
spy3 = Spy.new( { 'name' => 'Denise' } )
spy4 = Spy.new( { 'name' => 'Sterling' } )

s1 = spy1.save
s2 = spy2.save
s3 = spy3.save
s4 = spy4.save

operation = Operation.new( { 'country_id' => c1.id, 'spy_id' => s1.id } )
operation = Operation.new( { 'country_id' => c2.id, 'spy_id' => s2.id } )
operation = Operation.new( { 'country_id' => c3.id, 'spy_id' => s3.id } )
operation = Operation.new( { 'country_id' => c4.id, 'spy_id' => s4.id } )
operation = Operation.new( { 'country_id' => c1.id, 'spy_id' => s3.id } )
operation = Operation.new( { 'country_id' => c2.id, 'spy_id' => s1.id } )
operation = Operation.new( { 'country_id' => c3.id, 'spy_id' => s4.id } )
operation = Operation.new( { 'country_id' => c4.id, 'spy_id' => s2.id } )

binding.pry
nil