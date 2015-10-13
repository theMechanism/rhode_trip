require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'has a valid factory' do
    expect( build( :place ) ).to be_valid
  end
  let( :place ){ build( :place ) }

  describe 'validations' do
    it { expect( place ).to validate_presence_of( :name ) }
    it { expect( place ).to validate_uniqueness_of( :name ) }
    it { expect( place ).to validate_presence_of( :categories ) }
    it { expect( place ).to validate_presence_of( :line_1 ) }
    
    it 'calls custom address_validator method' do
      # for full test, see spec/validators
      place.zip = 'not a zip'
      expect( place.valid? ).to be( false )
    end
  end

  describe 'associations' do
    it { expect( place ).to belong_to( :author ) }
    it { expect( place ).to have_and_belong_to_many( :categories ) }
    it { expect( place ).to have_and_belong_to_many( :people ) }
    it { expect( place ).to have_many( :tags ) } # may need add'l tests to ensure that no db bloat - multiple tag assignments of same value
    it { expect( place ).to have_many( :uploads ).through( :embeds ) }
  end
end
