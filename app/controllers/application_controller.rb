# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include NotificationsHelper

  before_action :authenticate_user!
end
