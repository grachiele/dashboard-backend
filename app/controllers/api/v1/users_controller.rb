class Api::V1::UsersController < ApplicationController

# don't think these will be used
  def new
  end
  def edit
  end
#---------------------------------------------------------

# signup
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id})
      render json: { user: @user, jwt: token}
    end
  end

# edit preferences
  def update
    @user = current_user
    @user.update(user_params)
    # might have to have an if for validation
    render json: @user
  end

# delete account
  def destroy
  end

# this will be the user's homepage ?
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def index
    # request.headers["Authorization"] -----> decode
  end


  private

  def user_params
    params.permit(:username, :password, :news, :weather, :swanson, :zipcode)
  end

end
