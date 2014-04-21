require 'spec_helper'

describe Message, :vcr => true do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it 'should be able to format its phone numbers' do
    test_message = Message.new(:to => '1111111111', :from => '2222222222', :body => "hello")
    test_message.formatted_number(test_message.to).should eq '(111) 111-1111'
  end

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
