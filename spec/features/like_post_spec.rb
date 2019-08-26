require 'rails_helper'

RSpec.feature 'Like a Post' do
	before do
    @user = create(:user)
		login_as @user
    @post = create(:post, user: @user)
	end

	scenario 'Successful default like', :js do
		visit root_path
    visit user_path(@user)

    page_post = page.find("li[data-post-id]='" + post.id + "'")
    
    initial_count = page_post.find('section')
      .find(:xpath, '//span[@class="count"')
      .text 

    
    page_post.find('footer')
      .find(:xpath, "//a[@class='thumbs-up']")
      .click

    page_post.find('section')
      .find(:xpath, '//span[@class="count"')
      .text.should eql(initial_count + 1)
	end
end
