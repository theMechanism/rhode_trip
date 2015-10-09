require 'rails_helper'

RSpec.describe Admins::CategoriesController, type: :controller do

  context 'self join to parent category' do 
    
    it 'on create' do
      parent = create( :category )
      sign_in FactoryGirl.create(:admin)
      post :create, category: attributes_for( :category, :child ).merge({ parent_id: parent.id })
      expect( response ).to have_http_status( 302 )
      expect( Category.count ).to eq( 2 )
      expect( parent.children ).to eq( [ Category.last ] )
    end

    it 'on update' do
      parent = create( :category )
      child = create( :category, :child )
      sign_in FactoryGirl.create(:admin)
      put :update, category: attributes_for( :category, :child ).merge({ parent_id: parent.id })
      expect( response ).to have_http_status( 302 )
      expect( parent.children ).to eq( [ Category.last ] )
    end

  end
end
