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

fully_valid1 = {
  zip: '02827',
  city: 'Greene'
}

fully_valid2 = {
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
    
    it 'invalidata valid zip + invalid city' do
      test_host.address = valid_zip_fake_city
      expect( test_host.valid? ).to be( false )
    end
  end

  # describe 'associations' do

  #   it { expect( admin ).to have_many( :people ) }
  #   it { expect( admin ).to have_many( :places ) }
  # end
end