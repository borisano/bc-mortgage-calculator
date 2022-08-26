class AddTotalLoanAmountToMortgages < ActiveRecord::Migration[7.0]
  def change
    add_column :mortgages, :total_loan_amount ,:decimal, after: :property_price
  end
end