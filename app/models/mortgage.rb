class Mortgage < ApplicationRecord
  AMORTIZATION_PERIOD_OPTIONS = [5, 10, 15, 20, 25, 30] # Years of mortgages

  attr_accessor :down_payment, :payment_schedule, :amortization_period

  validates_presence_of :property_price
  validates_presence_of :annual_interest_rate
  validates_presence_of :payment_per_payment
  validate :correct_amortization_period

  enum payment_schedule: [:monthly, :bi_weekly, :acc_bi_weekly]

  before_validation :cast_amortization_period_to_number

  def self.amortization_period_collection
    collection = []
    AMORTIZATION_PERIOD_OPTIONS.each do |pso|
      collection << ["#{pso} Years", pso]
    end

    collection
  end

  #I experience very weird bug with enum not returning correct value. This is a dirty hack to make it work as expected.
  def payment_schedule_val
    Mortgage.payment_schedules.key read_attribute_before_type_cast(:payment_schedule)
  end

  protected

  def correct_amortization_period
    unless AMORTIZATION_PERIOD_OPTIONS.include? amortization_period
      errors.add :amortization_period, "Incorrect amortization period"
    end
  end

  def cast_amortization_period_to_number
    self.amortization_period = self.amortization_period&.to_i
  end

end