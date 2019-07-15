# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include NotificationHelper

  def index
    current_user ? render('/index') : redirect_to(new_user_registration_url)
  end
end
