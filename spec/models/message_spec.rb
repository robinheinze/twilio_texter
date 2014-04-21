require 'spec_helper'

describe Message do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it 'should be able to format its phone numbers' do
    test_message = Message.new(:to => '1111111111', :from => '2222222222', :body => "hello")
    test_message.formatted_number(test_message.to).should eq '(111) 111-1111'
  end
end
