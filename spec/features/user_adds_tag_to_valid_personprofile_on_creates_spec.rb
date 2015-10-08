require 'rails_helper'

RSpec.feature "UserAddsTagToValidPersonprofileOnCreates", type: :feature do
  
  it '"new" view allows user to manually add tags to person' do
    login_as(create(:user), scope: :user )
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
  end

end
