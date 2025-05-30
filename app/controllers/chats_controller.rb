class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.all
  end

  def show

  end

  def new
    @chat = Chat.new
    @users = User.all   
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.sender = current_user
    if @chat.save
      redirect_to chats_path, notice: "Chat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_path, notice: "Chat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "Chat was successfully deleted."
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end
