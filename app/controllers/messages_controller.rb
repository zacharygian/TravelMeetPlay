class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @user = current_user
    @messages = policy_scope(@conversation.messages)
    authorize @messages

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @conversation.messages.new
    authorize @message
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
  if @message.save
    ActionCable.server.broadcast 'room_channel',
                                   message: @message,
                                   user: @message.user,
                                   message_time: @message.message_time
  else
    render :new
  end
  authorize @message
end

private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

end
