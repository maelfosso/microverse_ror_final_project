# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include LikesHelper
  include ApplicationHelper
  include NotificationsHelper

  before_action :authenticate_user!
end
