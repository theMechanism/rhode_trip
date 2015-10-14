require 'rails_helper'

RSpec.describe User, type: :model do
  it 'each role has a valid factory' do
    expect( build( :user ) ).to be_valid
    expect( build( :user, :author ) ).to be_valid
    expect( build( :user, :publisher ) ).to be_valid
    expect( build( :user, :admin ) ).to be_valid
  end

  let( :user ){ build( :user ) }
  let( :author ){ build( :user, :author ) }
  let( :publisher ){ build( :user, :publisher ) }
  let( :admin ){ build( :user, :admin ) }

  describe 'validations' do
    # bulk of validations currently handled by Devise
    it { expect( user ).to validate_presence_of( :display_name ) }
    it { expect( user ).to validate_inclusion_of( :role ).in_array( User::ROLES ) }
  end

  describe 'associations' do
    it { expect( user ).to have_many( :people ) }
    it { expect( user ).to have_many( :places ) }
  end

  describe 'anonymous user privileges' do 
    it { expect( user.is_admin? ).to be( false ) }
    it { expect( user.can_self_publish? ).to be( false ) }  
    it { expect( user.is_author? ).to be( false ) }
  end

  describe 'standard author privileges' do
    it { expect( author.is_admin? ).to be( false ) }
    it { expect( author.can_self_publish? ).to be( false ) }  
    it { expect( author.is_author? ).to be( true ) }
  end

  describe 'self publisher privileges' do
    it { expect( publisher.is_admin? ).to be( false ) }
    it { expect( publisher.can_self_publish? ).to be( true ) }  
    it { expect( publisher.is_author? ).to be( true ) }
  end

  describe 'admin privileges' do
    it { expect( admin.is_admin? ).to be( true ) }
    it { expect( admin.can_self_publish? ).to be( true ) }  
    it { expect( admin.is_author? ).to be( true ) }
  end


end
