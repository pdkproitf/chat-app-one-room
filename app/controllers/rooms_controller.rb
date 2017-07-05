class RoomsController < ApplicationController
  def show
    @messages = Message.all
    @message = current_user.messages.build
  end
end
