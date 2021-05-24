class ApplicationController < ActionController::Base
  
  skip_before_action :verify_authenticity_token
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authorized_user?
     @user == current_user
  end
  
  def logout!
     session.clear
  end

  # protect_from_forgery with: :null_session

  # def current_user
  #   auth_headers = request.headers["Authorization"]
  #   if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     begin
  #       decoded_token = JWT.decode(
  #         token,
  #         Rails.application.credentials.fetch(:secret_key_base),
  #         true,
  #         { algorithm: "HS256" }
  #       )
  #       User.find_by(id: decoded_token[0]["user_id"])
  #     rescue JWT::ExpiredSignature
  #       nil
  #     end
  #   end
  # end

  # helper_method :current_user

  # def authenticate_user
  #   unless current_user
  #     render json: {}, status: :unauthorized
  #   end
  # end
end
