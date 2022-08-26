require 'rails_helper'

RSpec.describe MortgagesController, type: :controller do
  describe '#new' do

  end

  describe '#create' do
    let(:mortgage_params) { attributes_for(:mortgage) }

    context 'with correct params' do
      def send_post(mortgage_params)
        post :create, params: { mortgage: mortgage_params }
      end

      it 'creates new Mortgage' do
        expect { send_post(mortgage_params) }.to change(Mortgage, :count).by(1)
      end

      it 'redirects to #edit' do
        send_post(mortgage_params)

        expect(response).to redirect_to action: :edit
      end
    end

    context 'with incorrect params' do
      it 'throws error if amount is lees than down payment' do
        let(:mortgage_params) { attributes_for(:mortgage, property_price: 1, down_payment: 100 ) }

        it "doesn't create the Mortgage" do
          expect { send_post(mortgage_params) }
            .to change(Mortgage, :count).by(0)
        end

        it 'shows an error'
      end

      it 'throws error if amortization period is incorrect' do

      end

    end
  end
end