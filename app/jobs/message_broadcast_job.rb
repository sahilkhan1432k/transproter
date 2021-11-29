class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    mine =  ApplicationController.renderer.render partial: 'messages/mine', locals: { message: message}

    other = ApplicationController.renderer.render partial: 'messages/other', locals: { message: message}

    ActionCable.server.broadcast("room_channel_#{message.room_id}", { message: message, mine: mine, other: other })


    # ActionCable.server.broadcast("room_channel_#{message.room_id}", { message: render_message(message), mine: mine, other: other })

  end

  # private
  #
  #   def render_message(message)
  #
  #     mine =  ApplicationController.renderer.render partial: 'messages/mine', locals: { message: message}
  #     other = ApplicationController.renderer.render partial: 'messages/other', locals: { message: message}
  #
  #   end

end
