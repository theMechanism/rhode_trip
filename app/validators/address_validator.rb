require 'csv'

class AddressValidator < ActiveModel::EachValidator
  
  PATH = File.join(Rails.root, 'csv', 'RI_zip_codes.csv')

  # def init_vars
  #   @zip_names = {}
  #   @is_valid = nil
  #   @messages = []
  #   load_from_csv
  # end
  def validate_each(record, attribute, value)
    @zip_names = {}
    @is_valid = nil
    @messages = []
    load_from_csv
    # unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #   record.errors[attribute] << (options[:message] || "is not an email")
    # end
    unless attribute != nil
      return record.errors[ :attribute ] << 'Must suppply an address'
    end

    zip = attribute['zip']
    name = attribute['city']

    if valid_zip( zip ) && valid_name( name ) && valid_zip_name( zip, name)
      record.errors[ :attribute ] << @messages
    end

  end


  # def validate( record )
  #   init_vars
  #   zip = record.address[ :zip ]
  #   name = record.address[ :city ]

  #   if valid_zip( zip ) && valid_name( name ) && valid_zip_name( zip, name)
  #     return @is_valid = true
  #   else
  #     record.errors[ :address ] = @messages
  #   end
    
  # end

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
