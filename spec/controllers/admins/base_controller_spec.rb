require 'rails_helper'

# set up mock here to access module for tests
# only testing actions here -- and NOT rendered views
# does it fetch the correct objects, note errors etc etc
class PeopleController < ActionController::Base
  include RestActionsConcern
end



RSpec.describe Admins::BaseController, type: :controller do

  let(:mock_people_ctrl){ PeopleController.new }
  let(:person){ create( :person ) }

  context 'GET index' do

    it 'doesn\'t blow up?' do
      collection = mock_people_ctrl.send( :index )
      byebug
      # expect()
    end 
  end
end
