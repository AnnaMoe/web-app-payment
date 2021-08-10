class CreateInvoiceAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :zip_code
      t.string :city
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
