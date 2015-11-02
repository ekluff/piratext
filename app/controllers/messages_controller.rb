class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html { render 'new' }
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was shipped to sea"
      respond_to do |format|
        format.html { redirect_to @message }
        format.js
      end
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
