class MessagesController < ApplicationController

  @prompt_cars = Car.all.map(&:attributes).to_json
  host = "https://true-wheels-d6fd7f4aeeb5.herokuapp.com"
  SYSTEM_PROMPT = "Actúa como un vendedor de autos muy experto de un concesionario.

  Para dar informacion sobre autos, te limitarás a ofrecer EXCLUSIVAMENTE los que están contenidos en: #{@prompt_cars}.
  No se ofrecen otros autos que no esten en #{@prompt_cars}. Ten en cuenta la diferencia entre autos y camionetas.

  En tu respuesta, por favor no incluyas la imagen y sí construye por cada
  vehículo recomendado un link que tenga el nombre 'ver vehículo' y que tenga la
  siguiente forma: #{host}/cars/:id."

  # SYSTEM_PROMPT = seras un vendedor experto de autos, debes limitarte solo en la
  # informcacion contenida en este prompt. Ademas construiras por cada vehiculo
  # recomendado un link que tenga la siguiente forma: https://true-wheels-d6fd7f4aeeb5.herokuapp.com/cars/

  # @prompt_cars = @cars.map do |car|
    #"[#{car.id},#{car.brand},#{car.miles},#{car.color},#{car.acceleration},#{car.consumption},#{car.fuel_type},#{car.transmission},#{car.car_model},#{car.version},#{car.doors},#{car.body_type},#{car.airbags},#{car.tank_capacity},#{car.services}#{car.occur_accident},#{car.serial_number}]"
  #end.join("[]")
  #@prompt_cars = @prompt_cars.join("[]")

  def create
    @chat = Chat.find(params[:chat_id])
    #@message = Message.new(message_params.merge(role: "user", chat_id: @chat.id))
    @message = Message.new(message_params)
    # @message = @chat.messages.build(message_params)
    @message.role = "user"
    @message.chat_id = @chat.id
    if @message.save
      if @chat.title == "New Chat"
        @chat.title = chat_title.content
        @chat.save
      end
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      # @chat.with_instructions(instructions).ask(@message.content)cha
      Message.create(role: "assistant", chat_id: @chat.id, content: response.content)
      redirect_to chat_path(@chat)
    else
      render "/chats/show", status: :unprocessable_entity
    end
  end

  private

  def build_conversation_history
    @ruby_llm_chat = RubyLLM.chat
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(role: message.role, content: message.content)
    end
  end

  def chat_title
    message = @chat.messages.first.content
    RubyLLM.chat.with_instructions("Genera un nombre descriptivo para un chat que no sea mas de 6 palabras.
    El nombre tiene que ser una síntesis de lo contenido en #{message}").ask(@chat.messages.first)
  end

  def message_params
    params.require(:message).permit(:content)
  end

  # def cars_context
  #   "y responderas al usuario de acuerdo a la informacion contenida en : #{@prompt_cars}"
  # end

  def instructions
    [SYSTEM_PROMPT]
    .compact.join("\n\n")
  end

end
