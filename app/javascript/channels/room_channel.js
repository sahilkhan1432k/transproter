import consumer from './consumer'

  //$ (function () {} ; In is executed after rendering by enclosing
 //render $ ( '# messages') data ( 'room_id') can not be acquired
 $(function() {

  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') }, {

    connected() {

      //Called when the subscription is ready for use on the server

    },


    disconnected() {

      //Called when the subscription has been terminated by the server

    },


    received: function(data) {
      let current_user_id = $('#user-id').data('user-id');
      // let message_user_id = parseInt(data['message'].substring(97, 98 ));
      let message_user_id = $('#message-id').data('message-id');

      debugger
      console.log('current_user_id', current_user_id)
      console.log('message_user_id', message_user_id)

      let html;

        if (current_user_id === data.message.user_id){
          return $('#messages').append(data['mine']);
          // $('.chat-history > li').last().after(data.sender_html);
        }else{
          return $('#messages').append(data['other']);
          // return $('#other').append(data['message']);
          // // $('.chat-history > li').last().after(data.reciever_html);
        }

      // return $('#messages').append(data['message']);
      // const messageContainer = document.getElementByid('messages')
      // messageContainer.inerHtml = messageContainer.inerHtml + html

    },


    speak: function(message) {
      return this.perform('speak', {

        message: message

      });

    }

  });


  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {

    if (event.keyCode === 13) {

      chatChannel.speak(event.target.value);

      event.target.value = '';

      return event.preventDefault();

    }

  });
});
