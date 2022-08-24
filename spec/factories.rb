FactoryBot.define do
  factory(:mortgage) do
    property_price { 100000 }
    annual_interest_rate { 5.0 }
    payment_per_payment { 1000 }
  end
end