class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::StrongParameters
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :authenticate_user_from_token!

  def current_user
  	Rails.logger.debug("Accessing current_user")
  	@current_user
  end

  private

  def authenticate_user_from_token!
    Rails.logger.debug "==========> #{request.headers['token']}"

    authenticate_with_http_token do |token, options|
      user_email = options[:email].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        @current_user = user
        sign_in user, store: false
      end
    end
  end
end
