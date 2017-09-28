class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

# don't think these will be used
  def new
  end
  def edit
  end
#---------------------------------------------------------

# signup
  def create
    @user = User.create(user_params)
  end

# edit preferences
  def update
  end

# delete account
  def destroy
  end

# this will be the user's homepage ?
  def show
    @user = User.find(params[:id])
    render json: @user
  end


  private

  def user_params
    params.permit(:username, :password, :news, :weather, :zipcode)
  end

end
