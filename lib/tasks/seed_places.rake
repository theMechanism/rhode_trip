require 'csv'

namespace :seed_places do
  desc "read in seed places the Michael compiled"
  task from_csv: :environment do
    
    path = Rails.root.to_s + '/csv/places_seeds.csv'
    foo = CSV.read(path)
byebug
    CSV.foreach( csv_path ) do |row|
      zips_n_names[ row[0] ] = [ row[1], row[4] ]
    end
  end

end
