class CreatePaymentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_types do |t|
      t.string :credit_card
      t.string :lastschrift
      t.string :amazon_pay
      t.string :paypal
      t.string :name
      t.integer :card_number
      t.integer :cvc
      t.date :expiry_date
      t.integer :IBAN
      t.string :BIC

      t.timestamps
    end
  end
end
