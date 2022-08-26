class AddCalculationFieldToMortgage < ActiveRecord::Migration[7.0]
  def change
    add_column :mortgages, :amortization_period ,:integer, after: :annual_interest_rate
    add_column :mortgages, :down_payment ,:integer, after: :property_price

  end
end