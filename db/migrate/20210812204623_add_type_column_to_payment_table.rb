class AddTypeColumnToPaymentTable < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_types, :type, :string
    remove_column :payment_types, :credit_card
    remove_column :payment_types, :lastschrift
  end
end
