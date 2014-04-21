require 'spec_helper'

describe Phone do
  describe 'format' do
    it 'formats a given 10 digit string into phone number format' do
      Phone.format('1111111111').should eq '(111) 111-1111'
    end
  end
end
