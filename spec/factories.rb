FactoryBot.define do
  factory(:mortgage) do
    property_price { rand 100000..1000000 }
    annual_interest_rate { rand 1..10 }
    down_payment { property_price * 0.2 }
    amortization_period { Mortgage::AMORTIZATION_PERIOD_OPTIONS.sample }
    payment_schedule { [:monthly, :bi_weekly, :acc_bi_weekly].sample }
  end
end