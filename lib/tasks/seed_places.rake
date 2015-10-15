require 'csv'

namespace :seed do
  
  desc "read in seed categories that Michael compiled"
  task categories: :environment do
    path = Rails.root.to_s + '/csv/category_seeds.csv'
    children_names = CSV.read( path )
    parent_names = children_names.shift.drop(1)
    top_level = []
    parent_names.each do |name|
      top_level << Category.create( name: name, is_parent: true )
    end

    children_names.each do |line|
      subs = line.drop(1)
      subs.each_with_index do |name, i|
        Category.create( name: name, parent: top_level[ i ] )
      end
    end
  end
  
  desc "read in seed places that Michael compiled"
  task places: :environment do
    
    path = Rails.root.to_s + '/csv/places_seeds.csv'
    lines = CSV.read( path )
    column_names = lines.shift.map{|c| c.underscore.gsub(' ', '_') }

    lines.each do |line|
      attrs = {}
      splat = line.to_s.split(/\r?\n/)
      column_names.each_with_index do |attr, i|
        if %w(category sub_category).include?( attr )
          category = Category.find_by(name: line[ i ] )
          if attrs['category_ids'] && category.id
            attrs['category_ids'] << category.id
          elsif category.id
            attrs['category_ids'] = [ category.id ]
          end
        else
          attrs[ attr ] = line[ i ]
        end
      end
      Place.create( attrs )
    end
  end

end
