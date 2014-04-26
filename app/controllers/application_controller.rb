class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::StrongParameters

  before_filter :authenticate_user_from_token!

  private

    def authenticate_user_from_token!
      token = request.headers['auth-token'].to_s
      email = request.headers['auth-email'].to_s

      return if token.blank? || email.blank?

      user = User.find_by_email(email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
end
