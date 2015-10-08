require 'rails_helper'

RSpec.feature "AdminCreatesCategoryWithParents", type: :feature do

=begin
  PSEUDO CODE
  admin logs in
  visits categories path
  expect to see existing category(ies)
  selects add new category
  expect to see option, is parent
  if set to false -- 
    can add existing parent to this field

  click Submit / create
  expect to new category, nested under parent category 

=end
  let(:category){ create(:category) }

  it 'valid example, valid creation' do
    category
    login_as(create(:admin), scope: :admin )
    visit admins_categories_path
    expect(page).to have_content category.name
    click_link 'New'
    uncheck 'Is parent'
    expect(page).to have_content 'Select a parent category'
    select(category.name)
    fill_in('Name', :with => 'child category name')
    find('input[type="submit"]').click
    expect(page).to have_content 'child category name'
    expect( page.find( 'tr.is-odd td[role="parent"]' ) ).to have_content( category.name )
    # page.find( 'tr.is-odd td[role="parent"]' ).should have_content( category.name )
  end


end
