#controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController
    before_action :authenticate_user!
    #include Pundit
    #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized
      render json: {error: "You do not have access to"}, status: :forbidden
    end
  
    def authenticate_user!
      token = request.headers["Authorization"].to_s.split(" ").last
      decoded_token = JWT.decode(token, ENV.fetch("SECRET_TOKEN")).first
  
      @current_user ||= User.find(decoded_token["id"]) if decoded_token
    rescue JWT::DecodeError
      render json: {error: "Invalid token"}, status: :unauthorized
    end
  end