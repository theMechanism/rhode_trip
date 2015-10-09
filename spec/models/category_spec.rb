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
    it { expect( category ).to belong_to( :parent ) }
  end

  describe 'to String returns category name' do
    it { expect( category.to_s ).to eq( category.name ) }
  end

  describe 'self join' do
    it 'children returns children of parent category' do 
      category.save
      attrs = attributes_for( :category, :child ).merge( parent_id: category.id )
      expect( Category.create( attrs ) ).to be_a( Category )
      expect( category.children ).to eq([ Category.last ])
      expect( Category.last.children ).to be_empty
    end
  end
end
