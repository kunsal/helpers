class Api::V1::ChatsController < ApplicationController {
  def create
    chat = Chat.create chat_params
    help = Help.find(chat_params[:help_id])
    if chat.save
      ActionCable.broadcast_to help, {chat.as_json()}
    end
  end

  private
   def chat_params
    params.permit(:message, :help_id)
   end
  
}