require 'rails_helper'

RSpec.describe Admins::PeopleController, type: :controller do

  describe 'associating tags' do

    before do
      sign_in FactoryGirl.create(:admin)
      let( :person ){ build( :person ) }
    end

    it 'on create' do
      
    end
  end
end
