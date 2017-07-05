class MessagesController < ApplicationController

  def new
    @message = current_user.messages.build
  end

  def create
    message = current_user.messages.build content: params[:message][:content]
    if message.save!
      message.mentions.each do |mention|
        ActionCable.server.broadcast "room_channel_user_#{mention.id}", mention: true
      end
    end
  end
end
