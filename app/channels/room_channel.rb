class RoomChannel < ApplicationCable::Channel
  def subscribed

    stream_from "room_channel_#{params['room']}" 

  end

  def speak(data, current_user_id)
    
    Message.create! content: data['message'], user_id: current_user.id, room_id: params['room'], user: current_user
    user_id = current_user_id
  end

end
