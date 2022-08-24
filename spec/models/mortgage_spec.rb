require 'rails_helper'

RSpec.describe Mortgage, type: :model do
  let(:model) { build_stubbed(:mortgage) }

  describe 'factory' do
    it 'is valid' do
      expect(model).to be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to define_enum_for(:payment_schedule).with_values([:monthly, :bi_weekly, :acc_bi_weekly]) }

    describe 'amortization_period_options' do
      context 'with correct amortization period option' do
        it 'is valid' do
          expect(model).to be_valid
        end
      end

      context 'with incorrect amortization period option' do
        before { model.amortization_period = -1}

        it 'is invalid' do
          expect(model).to be_invalid
        end
      end
    end
  end

end