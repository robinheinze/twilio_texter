class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true, length: { is: 10 }
end
