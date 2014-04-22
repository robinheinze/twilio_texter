class Message < ActiveRecord::Base
  has_many :recipients, :inverse_of => :message
  has_many :contacts, through: :recipients
  validates :body, presence: true
  validates :from, presence: true
  accepts_nested_attributes_for :recipients
  attr_accessor :body, :recipients_attributes
end
