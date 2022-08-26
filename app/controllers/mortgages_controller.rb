class MortgagesController < ApplicationController
  before_action :set_mortgage, only: [:show, :edit]

  def new
    @mortgage = Mortgage.new
  end

  def create
    @mortgage = Mortgage.new(mortgage_params)

    if @mortgage.save
      flash[:notice] = "Your Mortgage was created"
      redirect_to mortgage_path(@mortgage.to_param)
    else
      flash[:alert] = "Your Mortgage was not created. Please fix the errors"
      render :new
    end
  end

  def show

  end

  def edit

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

  def set_mortgage
    @mortgage = Mortgage.find(params[:id])
  end
end