class ChangetypecolumOnPaymentTable < ActiveRecord::Migration[6.0]
  def change
    rename_column(:payment_types, :type, :payment_type)
  end
end
