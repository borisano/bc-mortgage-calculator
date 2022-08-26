class MortgagesController < ApplicationController
  def new
    @mortgage = Mortgage.new
  end

  def create
    @mortgage = Mortgage.new(mortgage_params)

    if @mortgage.save
      flash[:notice] = "Your Mortgage was created"
      redirect_to action: :index
    else
      flash[:alert] = "Your Mortgage was not created. Please fix the errors"
      render :new
    end
  end


  private

  def mortgage_params
    params
      .require(:mortgage)
      .permit(
        :property_price,
        :down_payment,
        :annual_interest_rate,
        :amortization_period,
        :payment_per_payment
      )
  end
end