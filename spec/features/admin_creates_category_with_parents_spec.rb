require 'rails_helper'

RSpec.feature "AdminCreatesCategoryWithParents", type: :feature do

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
    find('Create').click
    expect(page).to have_content 'child category name'
    expect( page.find( 'tr.is-odd td[role="parent"]' ) ).to have_content( category.name )
  end

end
