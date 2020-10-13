class UsersController < ApplicationController

  # Return all users
  def index
    @users = User.all
    render :json => @users
  end

  # Return user by id
  def show
    @user = User.find_by_id(params[:id])
    render :json => @user
  end

  # onniauth methods
  def self.from_omniauth(auth)
    # find an existing user or create a user and authorizations
    
    # returning users
    authorization = Authorization.find_by(provider: auth.provider, uid: auth.uid)
    if authorization
      return authorization.user
    end

    email = auth['info']['email']

    # match existing users
    existing_user = find_for_database_authentication(email: email.downcase)
    if existing_user
      existing_user.add_oauth_authorization(auth).save
      return existing_user
    end

    create_new_user_from_oauth(auth, email)
  end

  def add_oauth_authorization(data)
    authorizations.build({
      provider: data['provider'],
      uid: data['uid'],
      email: data['info']['email']
      # token: data['credentials']['token'],
      # secret: data['credentials']['secret'],
      # refresh_token: data['credentials']['refresh_token'],
      # expires: data['credentials']['expires'],
      # expires_at: (Time.at(data['credentials']['expires_at']) rescue nil),
    })
  end

  private

  def self.create_new_user_from_oauth(auth, email)
    user = User.new({
      email: email,
      username: email.split('@').first.gsub('.', ''),
      password: Devise.friendly_token[0,20]
    })
    if %w(google).include?(auth.provider)
      user.skip_confirmation!
    end
    user.add_oauth_authorization(auth)
    user.save
    user
  end


end
