require 'rails_helper'

RSpec.feature 'Post creation', type: :feature, js: true do
	before do
		@user = create(:user)
		login_as @user 
	end 

	scenario 'Successful creation' do
		visit root_path
		
		fill_in "post_title", with: "Some more text"
		fill_in "post_content", with: "Some more content"
		click_on "Share", xhr: true
		
		visit users_path(@user)

		expect(page).to have_content "Some more content"
	end
end