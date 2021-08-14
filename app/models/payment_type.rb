class PaymentType < ApplicationRecord
  has_many :orders
  validates :card_number, length: { in: 13..16,  message: "length is not correct" } 
  #validates :credit_card,  numericality: { only_integer: true }
  validates :card_number, presence: true
end
