
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  pp ENV['FACEBOOK_APP_ID']
  pp ENV['FACEBOOK_SECRET']
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  # provider :facebook, Rails.application.credentials.FACEBOOK_APP_ID, Rails.application.credentials.FACEBOOK_SECRET
end
