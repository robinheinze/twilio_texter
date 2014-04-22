require 'spec_helper'
require 'pry'

describe Message, :vcr => true do
  it { should have_many :recipients }
  it { should have_many :contacts }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }


end
