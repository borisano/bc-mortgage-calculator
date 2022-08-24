class Mortgage < ApplicationRecord
  AMORTIZATION_PERIOD_OPTIONS = [5, 10, 15, 20, 25, 30] # Years of mortgage

  attr_accessor :down_payment, :payment_schedule, :amortization_period

  validates_presence_of :property_price
  validates_presence_of :annual_interest_rate
  validates_presence_of :payment_per_payment
  validate :correct_amortization_period

  enum payment_schedule: [:monthly, :bi_weekly, :acc_bi_weekly]


  def self.amortization_period_collection
    collection = []
    AMORTIZATION_PERIOD_OPTIONS.each do |pso|
      collection << ["#{pso} Years", pso]
    end

    collection
  end

  protected

  def correct_amortization_period
    unless AMORTIZATION_PERIOD_OPTIONS.include? amortization_period
      errors.add :amortization_period, "Incorrect amortization period"
    end
  end

end