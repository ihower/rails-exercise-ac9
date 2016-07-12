class TodosController < ApplicationController

  def index
    @todos = Todo.all
    respond_to do |format|
      format.html
      format.json {
        render :json => @todos.to_json
      }
    end
  end

  def create
    @todo = Todo.new( todo_params )
    if @todo.save
      render :json => { :id => @todo.id }
    else
      render :json => { :message => "err"}, :status => 400
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    render :json => { :message => "ok" }
  end

  protected

  def todo_params
    params.require(:todo).permit(:title)
  end

end
