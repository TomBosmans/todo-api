# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = sort User.all
    users = paginate users
    render json: serialize(users), status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: serialize(user), status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: serialize(user), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      head :no_content
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
