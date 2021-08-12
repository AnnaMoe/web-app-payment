class PaymentType < ApplicationRecord
  has_many :orders
  #validates :credit_card, length: { in: 13..16,  message: "length is not correct" } 
  #validates :credit_card,  numericality: { only_integer: true }
end
