class ApplicationController < ActionController::API
  include Authenticable

  def current_user
    @current_user
  end

  def current_business
    @current_business
  end

  private

  def authenticate_request!
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      begin
        decoded = JsonWebToken.decode(token)
        if decoded[:user_id]
          @current_user = User.find(decoded[:user_id])
        elsif decoded[:business_id]
          @current_business = Business.find(decoded[:business_id])
        end
      # rescue JWT::ExpiredSignature, JWT::DecodeError
      #   render json: { errors: ['Not Authenticated'] }, status: :unauthorized

      rescue JWT::ExpiredSignature
        render json: { errors: ['Token has expired. Please log in again.'] }, status: :unauthorized
      rescue JWT::DecodeError
        render json: { errors: ['Invalid token. Please log in again.'] }, status: :unauthorized
      end
    else
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  end
end