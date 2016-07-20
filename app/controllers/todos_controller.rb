class TodosController < ApplicationController

  # just jQuery
  def v1
    @todos = Todo.all
  end

  # MVC
  def v2
    @todos = Todo.all
  end

  # Vue.js
  def v3
    @todos = Todo.all
  end

  # react
  def v4
    @todos = Todo.all
  end

  def index
    @todos = Todo.all

    render :json => @todos.to_json
  end

  def create
    @todo = Todo.new( todo_params )
    if @todo.save

      ActionCable.server.broadcast "todos_channel", Todo.all.as_json

      render :json => @todo
    else
      render :json => { :message => "err"}, :status => 400
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    ActionCable.server.broadcast "todos_channel", Todo.all.as_json

    render :json => { :message => "ok" }
  end

  protected

  def todo_params
    params.require(:todo).permit(:title)
  end

end
