(function() {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      let sender_type;
      console.log(data.user.id);
      console.log($('#current-user-id').val());
      if (data.user.id == $('#current-user-id').val()) {
        sender_type = 'host';
      }
      else {
        sender_type = 'player';
      }
      let message_element = '<div class="item"><div class="content speech-bubble-' + sender_type +'"><p><strong>' + data.user.first_name +
          '</strong> ' + data.message_time + '</p><p>' + data.message.body + '</p></div></div>'
      if (data.message.body) {
        $('#messages-table').append(message_element)
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
    }
  });

  $("#new_message").on('submit', function(event) {

    setTimeout(function() {
      $('#message_body').val('');
    }, 100);
  })
});
