require 'rails_helper'

RSpec.feature 'Comment Post' do
	before do
    @user = create(:user)
		login_as @user
    @post = create(:post, user: @user)
	end

	scenario 'Successful comment', :js do
    visit user_path(@user)

    page.find("li[data-post-id='#{@post.id}'] > footer > .comment-form textarea")
        .set("I comment by test through RSPEC\n")

		expect(page).to have_content "I comment by test through RSPEC"
	end
end
