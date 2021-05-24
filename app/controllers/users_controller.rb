class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
   if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end
  
  def create
    @user = User.new(
        username: params[:username], 
        email: params[:email], 
        password: params[:password], 
        password_confirmation: params[:password_confirmation]
      )
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else 
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  private
  
  # def user_params
  #   params.require(:user).permit(:username, :email, :password, :password_confirmation)
  # end


end
