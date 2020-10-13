class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :exception

    # def current_user
    #     @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
    # end

end
