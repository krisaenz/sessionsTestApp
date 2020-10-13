class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
  def google
    # google oauth goes here
  end
    
  private

  def auth_data
    request.env['omniauth.auth']
  end
    
end