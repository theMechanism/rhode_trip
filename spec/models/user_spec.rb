require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect( build( :user) ).to be_valid
  end

  let( :user ){ build( :user ) }

  describe 'validations' do
    # bulk of validations currently handled by Devise
    it { expect( user ).to validate_presence_of( :display_name ) }
  end

  describe 'associations' do
    it { expect( user ).to have_many( :people ) }
    it { expect( user ).to have_many( :places ) }
  end
end
