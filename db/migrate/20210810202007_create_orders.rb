class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :payment_type, null: false, foreign_key: true
      t.references :invoice_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
