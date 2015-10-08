require 'rails_helper'

RSpec.feature "UserAddsTagToValidPersonprofileOnCreates", type: :feature do
  
  it '"new" view allows user to manually add tags to person' do
    login_as(create(:user), scope: :user )
    visit new_users_person_path
    fill_in('Name', :with => 'unusual name')
    fill_in('Abstract', :with => 'unusual abst')
    fill_in('Description', :with => 'description')
    fill_in('Tags', :with => 'tag1 tag2 tag3')
    find('input[value="Create Person"]').click
    expect(page).to have_content 'unusual name\'s Tags'
    expect(page).to have_content 'tag1 tag2 tag3'
  end

end
