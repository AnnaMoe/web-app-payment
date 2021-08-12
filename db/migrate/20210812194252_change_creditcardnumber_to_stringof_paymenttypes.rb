class ChangeCreditcardnumberToStringofPaymenttypes < ActiveRecord::Migration[6.0]
  def change
    change_column :payment_types, :card_number, :string
  end
end
