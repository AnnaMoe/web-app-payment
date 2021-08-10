class Order < ApplicationRecord
  belongs_to :subscription
  belongs_to :payment_type
  belongs_to :invoice_address
end
