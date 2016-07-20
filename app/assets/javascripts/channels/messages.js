App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    console.log("connected");
  },
  disconnected: function() {
    console.log("disconnected");
  },

  // ActionCable.server.broadcast "public_room", :content => "hello"
  received: function(data) {
    alert( data.content );
  }
});
