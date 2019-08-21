require 'rails_helper'


RSpec.feature 'Post creation' do
	before do
		@user = create(:user)
		login_as @user
	end

	scenario 'Successful creation', :js do
		visit root_path

		fill_in "post_title", with: "Some more text"
		fill_in "post_content", with: "Some more content"
		click_on "Share"
		
		visit users_path(@user)

		expect(page).to have_content "Some more content"
	end
end