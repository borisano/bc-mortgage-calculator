require 'rails_helper'

RSpec.describe Mortgage, type: :model do
  let(:model) { build(:mortgage) }

  describe 'factory' do
    it 'is valid' do
      expect(model).to be_valid
    end
  end
end