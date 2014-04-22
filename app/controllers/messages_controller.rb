class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @contacts = Contact.order(:name)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      @message.recipients.each do |recipient|
        if recipient.save
          flash[:notice] = "Your message to #{recipient.contact.name} was sent!"
        elsif recipient.errors.any?
          flash[:alert] = "The following errors occurred:"
          recipient.errors.full_messages.each do |error_message|
            flash[:alert] = error_message
          end
        end
      end
      redirect_to messages_path
    else
      render :get_recipients
    end
  end

  def get_recipients
    render :recipient_form, :layout => false
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
