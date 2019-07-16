require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before { login_user }

  describe 'POST create ' do
    it 'creates new comment' do
      post :create

    end
  end
end
