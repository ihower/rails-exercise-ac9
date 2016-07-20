class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new( message_params )

    @message.save

    ActionCable.server.broadcast "public_room", @message.as_json
    
  end

  protected

  def message_params
    params.require(:message).permit(:content)
  end

end
