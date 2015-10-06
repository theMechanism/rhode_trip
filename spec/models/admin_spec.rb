require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  it 'has a valid factory' do 
    expect(build(:admin)).to be_valid
  end

  let( :admin ){ build(:admin) }

  # Basic validations
  # validations on email + pw handled by devise, and well tested
  describe 'validations' do
    it { expect( admin ).to validate_presence_of( :display_name ) }
    it { expect( admin ).to validate_uniqueness_of( :display_name ) }
  end

end
