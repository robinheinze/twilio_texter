class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :from, presence: true
  has_many :recipients
  has_many :contacts, through: :recipients
  accepts_nested_attributes_for :recipients

  # def recipients_attributes=(attributes)

  # end
end

