class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @messages = @room.messages.new(message_params)
  end

  private
  def message_params
    params.(:message).permit(:content).merge(room_id: @room.id)
  end
end
