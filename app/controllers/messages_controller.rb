class MessagesController < ApplicationController

  def new
    @message = current_user.messages.build
  end

  def create
    current_user.messages.create content: params[:message][:content]
  end

end
