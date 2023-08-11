# controllers/api/v1/sessions_controller.rb
class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: {user: user, token: user.generate_jwt}
    else
      render json: {error: "Invalid email or password"}, status: :unauthorized
    end
  end
end
