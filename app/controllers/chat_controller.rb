class ChatController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end
end
