require 'spec_helper'

describe Message, :vcr => true do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '5005550001', :from => '5005550006')
    message.save.should be_false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '5005550001', :from => '5005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 5005550001 is not a valid phone number."]
  end
end
