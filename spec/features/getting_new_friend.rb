require 'rails_helper'

RSpec.feature 'Frienship' do
	before do
    @user = create(:user)
		login_as @user
    create(:user, name: 'John')
	end

	scenario 'Successful add friend', :js do
    visit users_path

    click_link('Add Friend')

    find('a', text: 'Friend Request Sent')

    visit friendships_path(s: 's')

    expect(page).to have_content 'John'
	end
end
