class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :plan
      t.float :price

      t.timestamps
    end
  end
end
