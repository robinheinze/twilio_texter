class Recipient<ActiveRecord::Base
  belongs_to :contact
  belongs_to :message
  before_create :send_message

  def message
    Message.find(self.message_id)
  end

  def contact
    Contact.find(self.contact_id)
  end

  private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_TEST_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_TEST_ACCOUNT_SID'],
        :password => ENV['TWILIO_TEST_AUTH_TOKEN'],
        :payload => { :Body => self.message.body,
                      :To => self.contact.phone,
                      :From => self.message.from }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
