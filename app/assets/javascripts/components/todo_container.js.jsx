var TodoContainer = React.createClass({

  getInitialState: function(){
    return {
      todos: [],
      new_title_todo: ''
    }
  },

  componentDidMount: function () {
    var that = this;
    $.ajax({
      url: "/todos",
      dataType: "json",
      success: function(todos){
        that.setState( { todos: todos } );
      }
    })
  },

  handleRemoveClick: function(todo){
    var that = this;
    $.ajax({
      url : "/todos/" + todo.id,
      type: "DELETE",
      success: function(data){
        var todos = $.grep(that.state.todos, function(e){
          return e.id != todo.id
        });

        that.setState( { todos: todos });
      }
    })
  },
  handleChange: function(event){
    this.setState( { new_title_todo: event.target.value })
  },
  handleSubmit: function(){
     var that = this;
     console.log( that.state.new_todo_title );

     $.ajax({
       url: "/todos",
       type: "POST",
       data: {
         todo: {
           title: that.state.new_title_todo
         }
       },
       dataType: "json",
       success: function(data){
         var todos = that.state.todos;
         todos.push(data);

         that.setState( { todos: todos,
                          new_title_todo: ""
                        });
       }
     })
   },

  render: function(){
      return(
        <div>
          <input type="text" value={this.state.new_title_todo} onChange={this.handleChange}/>
          <button onClick={this.handleSubmit}>Submit</button>
          <TodoList todos={this.state.todos} onRemove={this.handleRemoveClick} />
        </div>
      )
  }

})
