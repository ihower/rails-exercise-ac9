App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    console.log("connected");
  },
  disconnected: function() {
    console.log("disconnected");
  },

  speak: function(content){
    this.perform("speak", { content: content } );
    $("#content-input").val("");
  },

  // ActionCable.server.broadcast "public_room", :content => "hello"
  received: function(data) {
    $("#message-list").append( data.html );
    $("#message_content").val("");
  }

});
