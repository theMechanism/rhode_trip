require 'rails_helper'

# custom validator, testing distinct from Place model

class TestHost
  include ActiveModel::Validations
  
  attr_accessor :address

  validates :address, presence: true, address: true
end

valid_zip_fake_city = {
  zip: '02802',
  city: 'FakeCity'
}

valid_city_fake_zip = {
  zip: '11111',
  city: 'Providence'
}

valid_entries_that_do_not_match = {
  zip: '02827',
  city: 'Providence'
}

conforms_to_csv = {
  zip: '02827',
  city: 'Greene'
}

unusual_caps = {
  zip: '02827',
  city: 'kent'
}

RSpec.describe AddressValidator do
  
  it 'has a valid instantiation' do 
    expect( AddressValidator.new({
      attributes: [:address]
    })).to be_a( AddressValidator )
  end

  let( :test_host ){ TestHost.new }

  describe 'use cases' do
    
    it 'invalidates valid zip + invalid city' do
      test_host.address = valid_zip_fake_city
      expect( test_host.valid? ).to be( false )
      expect( test_host.errors ).not_to be_empty
    end

    it 'invalidates fake zip, valid city' do 
      test_host.address = valid_city_fake_zip
      expect( test_host.valid? ).to be( false )
      expect( test_host.errors ).not_to be_empty
    end

    it 'invalidates valid_entries_that_do_not_match' do 
      test_host.address = valid_entries_that_do_not_match
      expect( test_host.valid? ).to be( false )
      expect( test_host.errors ).not_to be_empty
    end

    it 'validates data that fully matches csv entries' do
      test_host.address = conforms_to_csv
      expect( test_host.valid? ).to be( true )
      expect( test_host.errors ).to be_empty
    end

    it 'validates correct input with improper capitalizations' do
      test_host.address = unusual_caps
      expect( test_host.valid? ).to be( true )
      expect( test_host.errors ).to be_empty
    end
  end

end