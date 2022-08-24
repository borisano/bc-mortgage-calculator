class Mortgage < ApplicationRecord
  validates_presence_of :property_price
  validates_presence_of :annual_interest_rate
  validates_presence_of :payment_per_payment
end