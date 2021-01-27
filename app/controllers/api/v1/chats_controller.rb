class Api::V1::ChatsController < AuthBaseController
  def create
    chat = Chat.create chat_params
    help = Help.find(chat_params[:help_id])
    if chat.save
      ChatsChannel.broadcast_to(help, chat)
      render json: chat.to_json(include: {:user => {only: [:id, :first_name, :last_name]}}), status: :created
    end
  end
 
  private
   def chat_params
    params.permit(:message, :help_id, :user_id)
   end  
end