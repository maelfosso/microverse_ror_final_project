require 'rails_helper'


RSpec.feature 'Post creation' do
	before do
		@user = create(:user)
		login_as @user
	end

	scenario 'Successful creation', :js do
		visit root_path
		save_and_open_page

		fill_in "post[title]", with: "Some more text"
		fill_in "post[content]", with: "Some more content"
		# wait_until { !page.find("Share").visible? }
		click_button "Share"
		
		# visit root_path
		# visit user_path(@user)
		# save_and_open_page
		expect(page).to have_content "Some more text"
	end
end