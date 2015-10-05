require 'rails_helper'

# utility model with no ActiveRecord hooks -- unclear is this is only for validations or what

RSpec.describe Address do
  
  it 'has a valid instantiation' do 
    expect( Address.new ).to be_a( Address )
  end

  let( :addess ){ Address.new }

  # # Basic validations
  # # validations on email + pw handled by devise, and well tested
  # describe 'validations' do
  #   it { expect( admin ).to validate_presence_of( :display_name ) }
  #   it { expect( admin ).to validate_uniqueness_of( :display_name ) }
  # end

  # describe 'associations' do

  #   it { expect( admin ).to have_many( :people ) }
  #   it { expect( admin ).to have_many( :places ) }
  # end
end