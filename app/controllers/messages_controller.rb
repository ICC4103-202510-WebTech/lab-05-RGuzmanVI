class MessagesController < ApplicationController
    def index
      @messages = Message.all
    end
  
    def show
      @message = Message.find(params[:id])
    end

    def new
      @message = Message.new
      @users = User.all
      @chats = Chat.all
    end

    def edit
      @message = Message.find(params[:id])
      @users = User.all
      @chats = Chat.all
    end

    def update
      @message = Message.find(params[:id])
      @users = User.all
      @chats = Chat.all
      if @message.update(message_params)
        redirect_to @message, notice: "Message updated successfully"
      else
        render :edit
      end
    end

    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to root_path, notice: "Message sent successfully."
      else
        @users = User.all
        @chats = Chat.all
        render :new
      end
    end
  
    private
  
      def message_params
        params.require(:message).permit(:chat_id, :sender_id, :receiver_id, :body)
      end
 
  end
  