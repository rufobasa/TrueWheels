class MessagesController < ApplicationController
  SYSTEM_PROMPT = ""
  @prompt_cars = ""

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params.merge(role: "user", chat_id = @chat.id))
    # @message = @chat.messages.build(message_params)
    # @message.role = "user"
    # @message.chat_id = @chat.id
    if @message.save
      response = @chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat_id: @chat.id)
      redirect_to chat_path(@chat)
    else
      render "/chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(@message).permit(:content)
  end

  def cars_context
    "Here is the cars context: #{@prompt_cars}."
  end

  def instructions
    [SYSTEM_PROMPT, cars_context]
    .compact.join("\n\n")
  end

end
