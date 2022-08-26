class Mortgage < ApplicationRecord
  AMORTIZATION_PERIOD_OPTIONS = [5, 10, 15, 20, 25, 30] # Years of mortgages

  validates_presence_of :property_price
  validates_presence_of :annual_interest_rate
  validates_presence_of :payment_per_payment
  validates_presence_of :amortization_period
  validate :correct_amortization_period
  validates :down_payment, comparison: { less_than: :property_price }

  enum payment_schedule: [:monthly, :bi_weekly, :acc_bi_weekly]

  before_validation :cast_amortization_period_to_number
  before_validation :calculate_total_loan_amount
  before_validation :calculate_payment_per_period

  def self.amortization_period_collection
    collection = []
    AMORTIZATION_PERIOD_OPTIONS.each do |pso|
      collection << ["#{pso} Years", pso]
    end

    collection
  end

  def calculate_payment_per_period
    p = total_loan_amount
    r = per_payment_schedule_interest_rate
    n = nb_of_payments_total

    self.payment_per_payment = p * ( ( r * (1+r)**n ) / ( ((1+r)**n) + 1 ) )
  end

  def nb_of_payments_total
    nb_of_payments_per_year * amortization_period
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

  def calculate_total_loan_amount
    self.total_loan_amount = property_price - down_payment + get_insurance_value
  end



  def nb_of_payments_per_year
    case payment_schedule
    when 'monthly'
      12
    when 'bi_weekly'
      26
    when 'acc_bi_weekly'
      26
    end
  end

  def per_payment_schedule_interest_rate
    annual_interest_rate / nb_of_payments_total
  end


  def payment_per_year
    self.total_loan_amount / self.amortization_period
  end


  def get_insurance_value
    #down payment percent
    percent = ((down_payment / property_price) * 100).to_i
    case percent
    when 0..5
      20
    when 5...10
      10
    when 10...20
      5
    else
      0
    end

    self.insurance_percent = percent
    self.insurance_value = property_price * percent / 100

    self.insurance_value
  end

end