(function() {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      let sender;
      console.log(data.user.id);
      console.log($('#current-user-id').val());
      if (data.user.id == $('#current-user-id').val()) {
        sender = 'host';
      }
      else {
        sender = 'player';
      }
      let message_element = $('<div class="item"><div class="content speech-bubble-' + sender +'"><p><strong>' + data.user.first_name +
          '</strong> ' + data.message_time + '</p><p>' + data.message.body + '</p></div></div>')
      if (data.message.body) {
        $('#messages-table .message-items').append(message_element)
        console.log(message_element.get());
        message_element.get()[0].scrollIntoView({behavior: 'smooth'});
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
