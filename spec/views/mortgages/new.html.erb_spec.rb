require 'rails_helper'

RSpec.describe "mortgages/new.html.erb", type: :view do
  let(:@mortgage) { build(:mortgage) }

  xit 'renders elements' do
    render
    expect(rendered).to have_selector('#mortgages')
    expect(rendered).to have_selector('#results')

    expect(rendered).to have_selector('#property-price')
    expect(rendered).to have_selector('#annual-interest-rate')
    expect(rendered).to have_selector('#payment-schedule')
    expect(rendered).to have_selector('#payment-per-payment')
  end
end