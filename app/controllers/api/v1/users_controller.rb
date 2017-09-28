class Api::V1::UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :news, :weather)
  end

end
