# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "public_channel"
  end

  def speak(data)

    @message = Message.new( :content => data["content"] )

    @message.user = current_user

    if @message.save
      html = ApplicationController.renderer.render( :partial => "messages/message", :locals => { :message => @message } )
      ActionCable.server.broadcast "public_channel", { :html => html }
    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
