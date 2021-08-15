class Order < ApplicationRecord
  belongs_to :subscription
  belongs_to :payment_type
  belongs_to :invoice_address

  accepts_nested_attributes_for :invoice_address
  accepts_nested_attributes_for :payment_type
  accepts_nested_attributes_for :subscription
end
