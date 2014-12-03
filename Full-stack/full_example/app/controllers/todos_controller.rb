class TodosController < ApplicationController

  before_filter :authorize

  def index
    @todos = current_user.todos
    respond_to do |format|
      format.html
      format.json { render :json => { todos: @todos }}
    end
  end

  def show
    @todo = current_user.todos.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => { todo: @todo }}
    end
  end

  def new
    # @todo = current_user.todos.new
    @todo = Todo.new
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def create
    # todo = Todo.create(todo_params)
    # current_user.todos << todo
    todo = current_user.todos.create(todo_params)
    respond_to do |format|
      format.html { redirect_to todo_path(todo) }
      format.json { render :json => { todo: todo }}
    end
  end

  def destroy
    todo = current_user.todos.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to todos_path }
      format.json { render :json => { todo: todo }}
    end
  end

  def update
    todo = current_user.todos.find(params[:id])
    todo.update(todo_params)
    respond_to do |format|
      format.html { redirect_to todo_path(todo) }
      format.json { render :json => { todo: todo }}
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:text)
  end

end
