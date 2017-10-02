class ApplicationController < ActionController::API

  # before_action :authorized, except: [:login]

  def encode_token(payload)
    token = JWT.encode(payload, "flobble")
  end

  def auth_header
    header = request.headers['Authorization']
  end
  #
  def decoded_token
    if auth_header
      begin
        JWT.decode(auth_header, "flobble", true, {algorithm: 'HS256'})
      rescue JWT::DecodeError
        [{}]
      end
    end
  end
  #
  #
  def current_user
    if decoded_token
      if user_id = decoded_token[0]["user_id"]
        @user = User.find(user_id)
        # render json: @user
      end
    end
  end



  def logged_in?
    !!current_user
  end



  def authorized
    if logged_in?
      # redirect_to "/api/v1/users/#{@user.id}"
    else
      redirect_to "/"
    end
  end
  #

  def welcome
    if logged_in?
      render json: @user
    else
      render json: {message: "Please log in"}
    end

    
  end





end
