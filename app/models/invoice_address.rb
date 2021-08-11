class InvoiceAddress < ApplicationRecord
    has_many :orders
end
