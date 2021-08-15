class Subscription < ApplicationRecord
  has_many :orders

  scope :vorauszahlung, -> { where(choice_of_payment: "Vorauszahlung") }
  scope :monatszahlung, -> { where(choice_of_payment: "Monatszahlung") }
  scope :yearly, -> { where(duration_in_months: 12) }

  def total_price
    sprintf('%.2f', price * duration_in_months)
  end
end
