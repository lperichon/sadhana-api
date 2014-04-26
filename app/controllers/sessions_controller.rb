class SessionsController < Devise::SessionsController
  def create
    resource = User.find_by_email(params[:email])

    return invalid_login_attempt unless resource && resource.valid_password?(params[:password])
    
    data     = {
      auth_token: resource.authentication_token,
      auth_email: resource.email
    }
    render json: data, status: 201
  end

  private

  def invalid_login_attempt
	render json: {
	  success: false,
	  message: "Error with your login or password"
	}, status: 401
  end
end