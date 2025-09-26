class MessagesController < ApplicationController

  @prompt_cars = Car.all.map(&:attributes).to_json
  SYSTEM_PROMPT = "seras un vendedor experto de autos, debes limitarte solo en la
  informcacion contenida en este prompt. Ademas construiras por cada vehiculo
  recomendado un link que tenga la siguiente forma: https://true-wheels-d6fd7f4aeeb5.herokuapp.com/cars/"

  #@prompt_cars = @cars.map do |car|
    #"[#{car.id},#{car.brand},#{car.miles},#{car.color},#{car.acceleration},#{car.consumption},#{car.fuel_type},#{car.transmission},#{car.car_model},#{car.version},#{car.doors},#{car.body_type},#{car.airbags},#{car.tank_capacity},#{car.services}#{car.occur_accident},#{car.serial_number}]"
  #end.join("[]")
  #@prompt_cars = @prompt_cars.join("[]")

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params.merge(role: "user", chat_id: @chat.id))
    # @message = @chat.messages.build(message_params)
    # @message.role = "user"
    # @message.chat_id = @chat.id
    if @message.save
      response = RubyLLM.chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat_id: @chat.id)
      redirect_to chat_path(@chat)
    else
      render "/chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def cars_context
    "y responderas al usuario de acuerdo a la informacion contenida en : #{@prompt_cars}"
  end

  def instructions
    [SYSTEM_PROMPT, cars_context]
    .compact.join("\n\n")
  end

end
