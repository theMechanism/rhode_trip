require 'csv'

class AddressValidator < ActiveModel::Validator
  
  PATH = File.join(Rails.root, 'csv', 'RI_zip_codes.csv')

  def initialize
    @zip_names = {}
    @is_valid = nil
    @messages = []
    load_from_csv
  end

  def show
    @zip_names
  end

  def validate( record )
    zip = record.address[ :zip ]
    name = record.address[ :city ]

    if valid_zip( zip ) && valid_name( name ) && valid_zip_name( zip, name)
      return @is_valid = true
    else
      record.errors[ :address ] = @messages
    end
    
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
    unless @zip_names.values.flatten.uniq.include?( address[:city] )
      is_valid = false
      messages << 'That place name is not in Rhode Island. Please correct it or try another.'
      return false
    end
    true
  end

  def valid_zip_name( zip, name )
    unless @zip_names[ zip ].include?( city ) 
      is_valid = false
      messages << %{ The zip code you entered and the place name do not match up. Did you mean "#{ @zip_names[ address[:zip] ].join(' or ') }"}
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
