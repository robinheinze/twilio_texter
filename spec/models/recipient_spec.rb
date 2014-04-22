require 'spec_helper'

describe Recipient, :vcr => true do
  it { should belong_to :contact }
  it { should belong_to :message }

    it "doesn't save the message if twilio gives an error" do
    contact1 = Contact.create(:name => 'Geraldo', :phone => '5005550001')
    message1 = Message.create(:body => 'hi', :from => '5005550006')
    recipient1 = Recipient.new(:contact_id => contact1.id, :message_id => message1.id)
    recipient1.save.should be_false
  end

  it 'adds an error if the to number is invalid' do
    contact1 = Contact.create(:name => 'Geraldo', :phone => '5005550001')
    message1 = Message.create(:body => 'hi', :from => '5005550006')
    recipient1 = Recipient.new(:contact_id => contact1.id, :message_id => message1.id)
    recipient1.save
    recipient1.errors.messages[:base].should eq ["The 'To' number 5005550001 is not a valid phone number."]
  end
end
