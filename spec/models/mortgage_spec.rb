require 'rails_helper'

RSpec.describe Mortgage, type: :model do
  let(:model) { build(:mortgage) }

  describe 'factory' do
    it 'is valid' do
      expect(model).to be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to define_enum_for(:payment_schedule).with_values([:monthly, :bi_weekly, :acc_bi_weekly]) }
  end
end