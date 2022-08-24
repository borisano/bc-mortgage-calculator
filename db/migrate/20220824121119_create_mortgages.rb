class CreateMortgages < ActiveRecord::Migration[7.0]
  def change
    create_table :mortgages do |t|
      t.decimal :property_price
      t.decimal :annual_interest_rate
      t.decimal :payment_per_payment

      t.timestamps
    end
  end
end