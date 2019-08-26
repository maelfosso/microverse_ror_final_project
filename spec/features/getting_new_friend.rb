require 'rails_helper'

RSpec.feature 'Like a Post' do
	before do
    @user = create(:user)
		login_as @user
    @post = create(:post, user: @user)
	end

	scenario 'Successful friend process', :js do
		visit root_path
    visit users_path # _path(@user)

    friends = page.all('Unfried')
    
    page.first('a.addfriend').click

    page.all("Unfriend").count.should eq(friends.size + 1)
	end
end
