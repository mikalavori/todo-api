class TodosController < ApplicationController
  before_action :authorize_request

  def index
    render json: current_user.todos
  end

  def show
    render json: todo
  end

  def create
    todo = current_user.todos.build todo_params

    if todo.save
      render json: todo, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    todo.destroy
  end


  private

  def todo
    @todo ||= current_user.todos.find params[:id]
  end

  def todo_params
    params.require(:todo).permit :user_id, :title, :completed, :order
  end
end
