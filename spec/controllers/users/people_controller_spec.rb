require 'rails_helper'

RSpec.describe Users::PeopleController, type: :controller do

  describe 'create' do 
    it 'accepts nested attributes for acts_as_taggable_on' do
      login_as( create(:user) )
      
    end
  end
end
