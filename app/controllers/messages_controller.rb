class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @recipient = @message.recipients.new
    # 2.times { @message.recipients.build }
  end

  def create
    @message = Message.new(message_params)
    binding.pry
    if @message.save
      # 2.times do |i|
      #   if !@message.recipients.create(:contact_id => message_params[:recipients_attributes][i.to_s][:contact_id], :message_id => @message.id)
      #     render 'new'
      #   end
      # end
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      # 2.times { @message.recipients.build }
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body, :recipients_attributes => [:contact_id, :message_id])
  end
end
