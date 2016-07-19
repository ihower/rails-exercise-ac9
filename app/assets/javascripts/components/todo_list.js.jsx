var TodoItem = React.createClass({


  render: function(){
    var todo = this.props.todo;

    return (
      <li>
        { todo.title }
        <a onClick={this.props.onRemove.bind(null,todo)}>(remove)</a>
      </li>
    )
  }
});

var TodoList = React.createClass({

  render: function(){
    var todos = this.props.todos;
    var onRemove = this.props.onRemove;

    var items = todos.map(function(todo){
      return (
        <TodoItem todo={todo} onRemove={onRemove} />
      )
    })

    return (
      <ul>
        { items }
      </ul>
    )
  }

})
