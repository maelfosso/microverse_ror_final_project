class SessionController < ApplicationController
  def create
    env_d = request.env['omniauth.auth']
    debugger
  end

  def failure

  end 

  def destroy
  end
end
