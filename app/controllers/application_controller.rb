class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::StrongParameters

  before_filter :authenticate_user_from_token!

  def current_user
  	Rails.logger.debug("Accessing current_user")
  	@current_user
  end

  private

    def authenticate_user_from_token!
      token = request.headers['auth-token'].to_s
      email = request.headers['auth-email'].to_s
	  
      if token.blank? || email.blank?
      	render json: {
    		  success: false,
    		  message: "Error with your auth-token"
    		}, status: 401
  		return false
      end
      user = User.find_by_email(email)
      
      if user && Devise.secure_compare(user.authentication_token, token)
      	Rails.logger.debug("Setting current_user")
      	@current_user = user
        sign_in user, store: false
      end
    end
end
