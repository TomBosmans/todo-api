# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    todos = sort Todo.all
    todos = paginate todos
    render json: serialize(todos), status: :ok
  end

  def show
    todo = Todo.find(params[:id])
    render json: serialize(todo), status: :ok
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: serialize(todo), status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      head :no_content
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :completed_at, :list_id)
  end
end
