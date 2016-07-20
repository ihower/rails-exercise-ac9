App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    console.log("connected");
  },
  disconnected: function() {
    console.log("disconnected");
  },
  received: function(data) {
    console.log(data);
    $("#messages-list").prepend( data.html );
    $("#message_content").val("");
  },

  speak: function(content) {
    this.perform( "speak", { content: content } );
    $("#message_content").val("");
  }
});
