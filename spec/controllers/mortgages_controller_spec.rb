require 'rails_helper'

RSpec.describe MortgagesController, type: :controller do
  describe '#new' do

  end

  describe '#create' do
    let(:mortgage_params) { attributes_for(:mortgage) }
    def send_post(mortgage_params)
      post :create, params: { mortgage: mortgage_params }
    end

    context 'with correct params' do
      it 'creates new Mortgage' do
        expect { send_post(mortgage_params) }.to change(Mortgage, :count).by(1)
      end

      it 'redirects to show' do
        send_post(mortgage_params)
        mortgage = assigns(:mortgage)
        expect(response).to redirect_to mortgage_path(mortgage)
      end
    end

    context 'with incorrect params' do
      let(:mortgage_params) { attributes_for(:mortgage, property_price: 1, down_payment: 100 ) }

      it "doesn't create the Mortgage" do
        expect { send_post(mortgage_params) }
          .to change(Mortgage, :count).by(0)
      end

      it 'throws error if amortization period is incorrect' do

      end
    end
  end
end