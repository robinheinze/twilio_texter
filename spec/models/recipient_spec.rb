require 'spec_helper'

describe Recipient, :vcr => true do
  it { should belong_to :message }
  it { should belong_to :contact }

  it "doesn't save the message if twilio gives an error" do
    message = Message.create(:body => 'hi', :from => '5005550006')
    contact = Contact.create(:name => 'name', :phone => '5005550001')
    recipient = Recipient.new(:message_id => message.id, :contact_id => contact.id)
    recipient.save.should be_false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.create(:body => 'hi', :from => '5005550006')
    contact = Contact.create(:name => 'name', :phone => '5005550001')
    recipient = Recipient.new(:message_id => message.id, :contact_id => contact.id)
    recipient.save
    recipient.errors.messages[:base].should eq ["The 'To' number 5005550001 is not a valid phone number."]
  end
end
