class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])

    @user.save unless @user.persisted?
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  end

  def failure
    redirect_to root_path
  end
end
