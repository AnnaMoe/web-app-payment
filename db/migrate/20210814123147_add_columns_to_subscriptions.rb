class AddColumnsToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :duration_in_months, :integer
    add_column :subscriptions, :choice_of_payment, :string
    rename_column :subscriptions, :plan, :plan_type

  end
end
