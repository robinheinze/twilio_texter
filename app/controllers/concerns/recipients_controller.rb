class RecipientsController < ApplicationController
  def create
    @recipient = Recipient.create(recipient_params)
  end

  private

  def recipient_params
    params.require(:recipient).permit(:contact_id, :message_id)
  end
end
