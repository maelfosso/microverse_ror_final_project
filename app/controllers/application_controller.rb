# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include UsersHelper
  include LikesHelper
  include ApplicationHelper
  include NotificationsHelper

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    @posts = current_user.posts + current_user.friend_posts
    render 'users/home'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[name username gender date_of_birth nationality])
    devise_parameter_sanitizer.permit(:account_update, keys: %I[name username gender date_of_birth nationality])
  end
end
