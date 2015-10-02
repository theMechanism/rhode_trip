require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do 
    expect( build( :category) ).to be_valid
  end

  let( :category ){ build(:category) } 

  describe 'validations' do
    it { expect( category ).to validate_presence_of( :name ) }
    it { expect( category ).to validate_uniqueness_of( :name ) }
  end

  describe 'associations' do
    it { expect( category ).to have_and_belong_to_many( :places ) }
  end
end
