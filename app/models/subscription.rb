class Subscription < ApplicationRecord
  has_many :orders

  scope :vorauszahlung, -> { where(choice_of_payment: "Vorauszahlung") }
  scope :yearly, -> { where(duration_in_months: 12) }

end
