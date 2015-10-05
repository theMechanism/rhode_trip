require 'csv'

class AddressValidator < ActiveModel::EachValidator
  
  PATH = File.join(Rails.root, 'csv', 'RI_zip_codes.csv')

  def validate_each(record, attribute, value)
    @zip_names = {}
    @is_valid = nil
    @messages = []
    load_from_csv
    
    unless attribute != nil
      return record.errors[ :attribute ] << 'Must suppply an address'
    end

    zip = value[ :zip ]
    name = value[ :city ].capitalize

    unless valid_zip( zip ) && valid_name( name ) && valid_zip_name( zip, name)
      record.errors[ attribute ] << @messages
    end

  end

  def show 
    @zip_names
  end

  private

  def valid_zip( zip )
    unless @zip_names.keys.include?( zip )
      @is_valid = false
      @messages << 'That zip code is not in Rhode Island. Please correct it or try another.'
      return false
    end
    true
  end

  def valid_name( name )
    unless @zip_names.values.flatten.uniq.include?( name )
      @is_valid = false
      @messages << 'That place name is not in Rhode Island. Please correct it or try another.'
      return false
    end
    true
  end

  def valid_zip_name( zip, name )
    unless @zip_names[ zip ].include?( name ) 
      @is_valid = false
      @messages << %{ The zip code you entered and the place name do not match up. Did you mean "#{ @zip_names[ zip ].join(' or ') }"}
      return false
    end
    true
  end

  def load_from_csv
    CSV.foreach( PATH ) do |row|
      @zip_names[ row[0] ] = [ row[1], row[4] ]
    end
  end
end
