require_relative( 'models/country.rb' )
require_relative( 'models/spy.rb' )
require_relative( 'models/operations.rb' )
require( 'pry-byebug' )

Operations.delete_all()
Country.delete_all()
Spy.delete_all()




binding.pry
nil