# frozen_string_literal: true

class ListsController < ApplicationController
  def index
    lists = List.all
    render json: lists, status: :ok
  end

  def show
    list = List.find(params[:id])
    render json: list, status: :ok
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: list, status: :created
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      head :no_content
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    head :no_content
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
