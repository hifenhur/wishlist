class Api::UsersController < ApplicationController
    skip_before_action :authorized
  
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :password)
    end
  
  end