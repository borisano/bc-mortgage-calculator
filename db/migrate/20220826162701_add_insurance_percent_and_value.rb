class AddInsurancePercentAndValue < ActiveRecord::Migration[7.0]
  def change
    add_column :mortgages, :insurance_percent ,:integer
    add_column :mortgages, :insurance_value, :decimal
  end
end