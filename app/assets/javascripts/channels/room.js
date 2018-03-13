(function() {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      if (data.message.body) {
        $('#messages-table').append('<div class="message">' +
        '<div class="message-user">' + data.user.first_name + ":" + '</div>' +
        '<div class="message-content">' + data.message.body + '</div>' + '</div>')
      }
    }
  });

}).call(this);

$(document).ready(function() {
  $('#message_body').on('keydown', function(event) {
    // return console.log(event);
    if (event.keyCode === 13) {
      $('#new_message').submit()
      event.preventDefault()
      event.target.value = ""
    }
  });
});
