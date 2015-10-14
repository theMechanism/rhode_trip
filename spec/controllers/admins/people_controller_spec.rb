require 'rails_helper'

RSpec.describe Admins::PeopleController, type: :controller do
  let( :person ){ build( :person ) }
  let( :author ){ create( :user ) }

  before :each do
    sign_in FactoryGirl.create( :user, :admin )
    @to_merge = { acts_as_taggable_on_tag: { name: 'tag1, tag2, tag3' }, author_id: author.id }
  end

  describe 'associating tags' do
    # same methods used in admins::places tags, though may need test there too if complications arise
    it 'POST create' do
      post :create, person: person.attributes.merge( @to_merge )
      expect( Person.count ).to eq( 1 )
      expect( Person.last.tags.count ).to eq( 3 )
    end

    it 'PUT update' do
      person.update_attributes( author: author )
      put :update, { 
        id: person.id, 
        person: person.attributes.merge( @to_merge )
      }
      expect( Person.count ).to eq( 1 )
      expect( Person.find(person.id).tags.count ).to eq( 3 )
    end
  end
end
