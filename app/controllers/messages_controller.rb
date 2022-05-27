class MessagesController < ApplicationController
    def create
        @chatroom=Chatroom.find(params[:chatroom_id])
        # message needs info from the form
        @message=Message.new(message_params)
        #message needs a chatroom
        @message.chatroom = @chatroom
        #message needs a user
        @message.user = current_user

        if @message.save
            redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
        else
            render "chatrooms/show"
        end
        binding.pry

    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
