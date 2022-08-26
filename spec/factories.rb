FactoryBot.define do
  factory(:mortgage) do
    property_price { 100000 }
    annual_interest_rate { 5.0 }
    payment_per_payment { 1000 }
    down_payment { property_price * 0.2 }
    amortization_period { Mortgage::AMORTIZATION_PERIOD_OPTIONS.sample }
    payment_schedule { [:monthly, :bi_weekly, :acc_bi_weekly].sample }
  end
end