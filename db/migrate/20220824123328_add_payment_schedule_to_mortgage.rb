class AddPaymentScheduleToMortgage < ActiveRecord::Migration[7.0]
  def change
    add_column :mortgages, :payment_schedule ,:integer, default: 0
  end
end