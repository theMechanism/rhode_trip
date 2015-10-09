require 'rails_helper'

module Mock
  class PeopleController < Admins::BaseController
    skip_before_action :authenticate_admin! #avoid reroutes
    include RestActionsConcern

    private

    def permitted_params
      params.
        require(:person).
        permit(:name, :abstract, :description, :occupation, :allow_comments, :approved, :author_id, :author_type)
    end
  end
end

test_routes = Proc.new do
  namespace 'mock' do
    resources :people
  end
end

Rails.application.routes.send(:eval_block, test_routes)

RSpec.describe Mock::PeopleController, type: :controller do

  # NOTE -- not testing rendered views -- as the base controller needs minimal hard coded content for each view. only testing controller actions. 

  let( :person ){ create( :person ) }
  let( :attrs ){ attributes_for( :person) }

  it 'GET index' do
    person
    get :index
    expect( assigns( :collection ) ).to eq( Person.all ) 
    expect( response ).to have_http_status( :success ) 
  end

  it 'GET new' do 
    get :new
    expect( assigns( :resource ) ).to be_a_new( Person )
    expect( response ).to have_http_status( :success )
  end

  it 'POST create, valid params' do
    post :create, person: attrs
    expect( response ).to have_http_status( 302 ) # redirect to index 
    expect( Person.count ).to eq( 1 )
  end

  it 'POST create, invalid params' do
    post :create, person: attrs.except( :name )
    expect( Person.count ).to eq( 0 )
    expect( assigns( :resource ).errors ).not_to be_empty
  end

  it 'GET edit' do
    get :edit, id: person.id
    expect( assigns( :resource ) ).to eq( person )
    expect( response ).to have_http_status( :success )
  end

  it 'PUT update' do
    put :update, { id: person.id, person: attrs }
    expect( person.name ).to eq( attrs[:name] )
  end

  it 'DELETE destroy' do
    delete :destroy, id: person.id
    expect( Person.count ).to eq( 0 )
  end

end
