require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a valid factory' do 
    expect( build( :person) ).to be_valid
  end

  let( :person ){ build( :person ) }

  describe 'validations' do
    it { expect( person ).to validate_presence_of( :name ) }
    it { expect( person ).to validate_uniqueness_of( :name ) }
    it { expect( person ).to validate_presence_of( :description ) }
    it { expect( person ).to validate_presence_of( :abstract ) }
  end

  describe 'associations' do
    it { expect( person ).to belong_to( :author ) }
    it { expect( person ).to have_and_belong_to_many( :places ) }
    it { expect( person ).to have_many( :tags ) } # may need add'l tests to ensure that no db bloat - multiple tag assignments of same value
    it { expect( person ).to have_many( :uploads ).through( :embeds ) }
  end

end
