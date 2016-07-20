class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new( message_params )

    @message.save

    html = ApplicationController.renderer.render( :partial => "messages/message", :locals => { :message => @message } )

    ActionCable.server.broadcast "public_room", { :html => html }
  end

  protected

  def message_params
    params.require(:message).permit(:content)
  end

end
