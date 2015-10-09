require 'rails_helper'

# set up mock here to access module for tests
# only testing actions here -- and NOT rendered views
# does it fetch the correct objects, note errors etc etc
class PeopleController < ActionController::Base
  include RestActionsConcern
end


RSpec.describe PeopleController, type: :controller do

  let(:mock_ctrl){ PeopleController.new }
  let(:person){ create( :person ) }

  context 'inheritance + helper methods' do
    it 'infers correct class name' do 
      expect( mock_ctrl.resource_class ).to eq( Person )
    end

    it 'inherits all defined methods' do
      # cannot test these in action bc there is no Rails defined route... limitation of rspec env
      # attempt to test action in admins::base
      expect( mock_ctrl.respond_to?( :index ) ).to be(true)
      expect( mock_ctrl.respond_to?( :new ) ).to be(true)
      expect( mock_ctrl.respond_to?( :create ) ).to be(true)
      expect( mock_ctrl.respond_to?( :edit ) ).to be(true)
      expect( mock_ctrl.respond_to?( :update ) ).to be(true)
      expect( mock_ctrl.respond_to?( :destroy ) ).to be(true)
      expect( mock_ctrl.respond_to?( :collection_path ) ).to be(true)
      expect( mock_ctrl.respond_to?( :new_resource_path ) ).to be(true)
      expect( mock_ctrl.respond_to?( :edit_resource_path ) ).to be(true)
      expect( mock_ctrl.respond_to?( :resource_path ) ).to be(true)
    end

    it 'infers correct inflections' do
      expect( mock_ctrl.send( :inflections ) ).to eq({
        collection_name: 'People',
        resource_name: 'Person'
      })
    end
  end
end
