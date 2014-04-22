require 'spec_helper'

describe Message, :vcr => true do
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }
  it { should have_many :recipients }
  it { should have_many :contacts }


end
