class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: session_params[:email])
  
    if @user && @user.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: { 
        status: 401,
        errors: ['no such user', 'verify credentials and try again or signup']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
  
#  def create
#     user = User.find_by(email: params[:email])
#     if user && user.authenticate(params[:password])
#       jwt = JWT.encode(
#         {
#           user_id: user.id, # the data to encode
#           exp: 24.hours.from_now.to_i # the expiration time
#         },
#         Rails.application.credentials.fetch(:secret_key_base), # the secret key
#         "HS256" # the encryption algorithm
#       )
#       render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
#     else
#       render json: {}, status: :unauthorized
#     end
#   end
  
end
