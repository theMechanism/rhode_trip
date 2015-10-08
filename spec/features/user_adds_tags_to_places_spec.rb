require 'rails_helper'

RSpec.feature "UserAddsTagsToPlaces", type: :feature do
  it '"new" view allows user to manually add single tag to place' do
    category = create( :category )
    attrs = attributes_for(:place)
    login_as(create(:user), scope: :user )
    visit new_users_place_path
    fill_in('Name', :with => 'a place in rhode island')
    fill_in('Tags', :with => 'tag1')
    check( category.name )
    fill_in('Line 1', :with => attrs[:line_1])
    fill_in('City', :with => attrs[:city])
    fill_in('Zip', :with => attrs[:zip])
    find('input[value="Create Place"]').click
    expect(page).to have_content 'Tags'
    expect(page).to have_content 'tag1'
  end

  # it '"new" view allows user to manually add multiple tags to place' do
  #   login_as(create(:user), scope: :user )
  #   visit new_users_person_path
  #   fill_in('Name', :with => 'unusual name')
  #   fill_in('Abstract', :with => 'unusual abst')
  #   fill_in('Description', :with => 'description')
  #   fill_in('Tags', :with => 'tag1, tag2 tag3')
  #   find('input[value="Create Person"]').click
  #   page.assert_selector('ul.tags li', :count => 3)
  # end
end
